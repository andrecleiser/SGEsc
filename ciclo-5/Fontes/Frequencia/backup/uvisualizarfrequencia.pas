unit uvisualizarfrequencia;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, FileUtil, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, StdCtrls, EditBtn, DBGrids, DbCtrls, ExtDlgs, uFormBase,
  maskutils, dateutils;

type

  { TfrmVisualizarFrequencia }

  TfrmVisualizarFrequencia = class(TfrmBase)
    btnConsultarAlunoPorNome: TBitBtn;
    btnFrequencia: TBitBtn;
    btnConsultarTurmas: TBitBtn;
    CalendarDialog: TCalendarDialog;
    dsTurmaAluno: TDataSource;
    dsFrequencia: TDataSource;
    dblkpTurma: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    dtpFim: TDateEdit;
    dtpInicio: TDateEdit;
    edtCodigoAluno: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblNomeAluno: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    sqlFrequencia: TSQLQuery;
    sqlFrequenciadata_frequencia: TDateField;
    sqlFrequenciahora_frequencia: TStringField;
    sqlTurmaAluno: TSQLQuery;
    sqlTurmaAlunodescricao: TStringField;
    sqlTurmaAlunofk_turma_id: TLargeintField;
    sqlTurmaAlunohora_inicio: TStringField;
    procedure btnFrequenciaClick(Sender: TObject);
    procedure btnConsultarTurmasClick(Sender: TObject);
    procedure btnConsultarAlunoPorNomeClick(Sender: TObject);
    procedure dtpInicioButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var {%H-}CloseAction: TCloseAction);
    procedure sqlFrequenciahora_frequenciaGetText(Sender: TField;
      var aText: string; {%H-}DisplayText: Boolean);
  private
    procedure validarAluno(codigoAluno: string);

  public

  end;

var
  frmVisualizarFrequencia: TfrmVisualizarFrequencia;

implementation

uses
  uDATMOD, uconsulta_aluno, uAluno, uAlunoService;

{$R *.lfm}

{ TfrmVisualizarFrequencia }

procedure TfrmVisualizarFrequencia.btnConsultarAlunoPorNomeClick(Sender: TObject
  );
var
  codigoAluno: integer;
begin
  codigoAluno := TfrmConsultaAluno.abrirConsultaAluno([ccRetornar, ccApenasAtivos]);
  if codigoAluno > 0 then
  begin
    edtCodigoAluno.Text:=codigoAluno.ToString;
    btnConsultarTurmas.Click;
  end;
end;

procedure TfrmVisualizarFrequencia.dtpInicioButtonClick(Sender: TObject);
begin
  if CalendarDialog.Execute then
    TDateEdit(Sender).Date := CalendarDialog.Date;
end;

procedure TfrmVisualizarFrequencia.btnFrequenciaClick(
  Sender: TObject);
var
  codigoAluno: string;
  dataInicial: string;
  dataFinal: string;
begin
  codigoAluno := edtCodigoAluno.Text;

  validarAluno(codigoAluno);

  try
    dataInicial:= FormatDateTime('yyyy-mm-dd', dtpInicio.Date);
    if dataInicial.Trim.Length = 0 then
    begin
      dtpInicio.SetFocus;
      raise Exception.Create('A data inicial inválida.');
    end;
  except
    raise;
  end;

  try
    dataFinal := FormatDateTime('yyyy-mm-dd', dtpFim.Date);
    if dataFinal.Trim.Length = 0 then
    begin
      dtpFim.SetFocus;
      raise Exception.Create('A data final inválida.')
    end;
  except
    raise;
  end;

  if dateutils.CompareDate(dtpInicio.Date, dtpFim.Date) > 0 then
  begin
    dtpInicio.SetFocus;
    raise Exception.Create('A data inicial não pode ser maior do que a data final');
  end;
  sqlFrequencia.Close;
  sqlFrequencia.ServerFilter := 'f.fk_turma_id = ' +
                                sqlTurmaAlunofk_turma_id.AsString +
                                ' and f.fk_aluno_id = ' + codigoAluno.Trim +
                                ' and data_frequencia between ' + QuotedStr(dataInicial) + ' and ' + QuotedStr(dataFinal);

  sqlFrequencia.ServerFiltered:=true;
  sqlFrequencia.Open;
end;

procedure TfrmVisualizarFrequencia.btnConsultarTurmasClick(
  Sender: TObject);
var
  codigoAluno: string;
  aluno: TAluno;

begin
  codigoAluno := edtCodigoAluno.Text;
  validarAluno(codigoAluno);

  sqlTurmaAluno.Close;

  sqlTurmaAluno.ServerFilter := 'f.fk_aluno_id = ' + codigoAluno.Trim;
  sqlTurmaAluno.Open;

  btnFrequencia.Enabled := not sqlTurmaAluno.IsEmpty;
  if sqlTurmaAluno.IsEmpty then
  begin
    edtCodigoAluno.SetFocus;
    lblNomeAluno.Caption := '';
    raise Exception.Create('Não existe turma ativa relacionada ao aluno');
  end;

  try
    aluno := TAlunoService.obterAluno(codigoAluno.Trim.ToInteger, [saAtivo]);
    lblNomeAluno.Caption := aluno.nome;
  finally
    aluno.Free;
  end;
  dblkpTurma.ItemIndex := 0;
end;

procedure TfrmVisualizarFrequencia.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  sqlTurmaAluno.Close;
  sqlFrequencia.Close;
end;

procedure TfrmVisualizarFrequencia.sqlFrequenciahora_frequenciaGetText(
  Sender: TField; var aText: string; DisplayText: Boolean);
begin
  aText := FormatMaskText('00\:00;0;', Sender.AsString);
end;

procedure TfrmVisualizarFrequencia.validarAluno(codigoAluno: string);
begin
  if codigoAluno.Trim.Length = 0 then
  begin
    edtCodigoAluno.SetFocus;
    raise Exception.Create('Informe o código do aluno');
  end;
end;

end.

