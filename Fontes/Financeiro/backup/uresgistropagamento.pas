unit uResgistroPagamento;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, Buttons, DbCtrls, StdCtrls, DBGrids,
  uCadastroPadrao, uAluno, DateUtils;

type

  { TfrmRegistrarPagamento }

  TfrmRegistrarPagamento = class(TfrmCadastroPadrao)
    btnConsultarAluno: TBitBtn;
    btnConsultarAlunoPorNome: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBGrid1: TDBGrid;
    dblTurma: TDBLookupComboBox;
    DBMemo1: TDBMemo;
    dbtDescricao_Turma: TDBText;
    edtCodigoAluno: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblObservacao: TLabel;
    lblNomeAlunoFrente: TLabel;
    lblNomeAlunoFundo: TLabel;
    Panel1: TPanel;
    pnlCampos: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    pnlDados: TPanel;
    sqlQueryPadraoano: TLargeintField;
    sqlQueryPadraodata_pagamento: TDateField;
    sqlQueryPadraodescricao: TStringField;
    sqlQueryPadraofk_aluno_id: TLargeintField;
    sqlQueryPadraofk_turma_id: TLargeintField;
    sqlQueryPadraohora_inicio: TStringField;
    sqlQueryPadraoid: TLargeintField;
    sqlQueryPadraomes: TLargeintField;
    sqlQueryPadraoobservacao: TStringField;
    sqlQueryPadraovalor: TFloatField;
    procedure btnConsultarAlunoClick(Sender: TObject);
    procedure btnConsultarAlunoPorNomeClick(Sender: TObject);
    procedure DBMemo1Change(Sender: TObject);
    procedure dsPadraoStateChange(Sender: TObject);
    procedure edtCodigoAlunoEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sqlQueryPadraoAfterInsert(DataSet: TDataSet);
    procedure sqlQueryPadraoAfterPost(DataSet: TDataSet);
    procedure sqlQueryPadraoBeforePost(DataSet: TDataSet);
  private
    aluno: TAluno;
    idTurmas: string;

    procedure validarCampoVazio;
    procedure atualizarDadosAluno;
    procedure mostrarDadosAluno(mostrar: boolean);

  public

  end;

var
  frmRegistrarPagamento: TfrmRegistrarPagamento;

implementation

uses
  uconsulta_aluno, uFinanceiroService, uAlunoService, uDATMOD;

{$R *.lfm}

{ TfrmRegistrarPagamento }

procedure TfrmRegistrarPagamento.btnConsultarAlunoClick(Sender: TObject);
var
  codigoAluno: string;
begin
  validarCampoVazio;

  codigoAluno := edtCodigoAluno.Text;

  try
    aluno := TAlunoService.obterAluno(codigoAluno.ToInteger, [saAtivo]);

    TFinanceiroService.validarAluno(aluno, idTurmas);

    atualizarDadosAluno;

    sqlQueryPadrao.Close;
    sqlQueryPadrao.Params[0].AsInteger := aluno.id;
    sqlQueryPadrao.Open;

    DataModuleApp.qryLookUpTurma.Close;
    DataModuleApp.qryLookUpTurma.ServerFilter := 'fk_turma_id in (' + idTurmas + ')';
    DataModuleApp.qryLookUpTurma.ServerFiltered := true;
    DataModuleApp.qryLookUpTurma.Open;
  except
    edtCodigoAluno.SetFocus;
    raise;
  end;
end;

procedure TfrmRegistrarPagamento.btnConsultarAlunoPorNomeClick(Sender: TObject);
var
  codigoAluno: integer;
begin
  codigoAluno := TfrmConsultaAluno.abrirConsultaAluno([ccRetornar, ccApenasAtivos]);
  if codigoAluno > 0 then
  begin
    edtCodigoAluno.Text:=codigoAluno.ToString;
    btnConsultarAluno.Click;
  end
  else
    edtCodigoAluno.SetFocus;
end;

procedure TfrmRegistrarPagamento.DBMemo1Change(Sender: TObject);
begin
  lblObservacao.Caption := 'Observação - ' + TDBMemo(Sender).Lines.Text.Length.ToString + ' caracteres digitados de 100.';
end;

procedure TfrmRegistrarPagamento.dsPadraoStateChange(Sender: TObject);
begin
  inherited;
  pnlCampos.Enabled := TDataSource(Sender).State in [dsInsert, dsEdit];
  dbtDescricao_Turma.Visible := not (TDataSource(Sender).State in [dsInsert, dsEdit]);
  dblTurma.Visible := not dbtDescricao_Turma.Visible;
end;

procedure TfrmRegistrarPagamento.edtCodigoAlunoEnter(Sender: TObject);
begin
  mostrarDadosAluno(false);
end;

procedure TfrmRegistrarPagamento.FormCreate(Sender: TObject);
begin
  inherited;
  captionForm := 'Registro de pagamento do aluno';
end;

procedure TfrmRegistrarPagamento.FormDestroy(Sender: TObject);
begin
  if Assigned(aluno) then aluno.Free;
  DataModuleApp.qryLookUpTurma.Close;
  DataModuleApp.qryLookUpTurma.Filtered := false;
  inherited;
end;

procedure TfrmRegistrarPagamento.sqlQueryPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  sqlQueryPadraofk_aluno_id.AsInteger := aluno.id;
  sqlQueryPadraovalor.AsFloat := DataModuleApp.qryLookUpTurmavalor_sugerido.AsFloat;
  sqlQueryPadraodata_pagamento.AsDateTime := Today();
  sqlQueryPadraofk_turma_id.AsInteger := dblTurma.ListSource.DataSet.FieldByName('id').AsInteger;
  sqlQueryPadraomes.AsInteger := MonthOf(Today());
  sqlQueryPadraoano.AsInteger := YearOf(Today());
end;

procedure TfrmRegistrarPagamento.sqlQueryPadraoAfterPost(DataSet: TDataSet);
begin
  inherited;
  sqlQueryPadrao.Refresh;
end;

procedure TfrmRegistrarPagamento.sqlQueryPadraoBeforePost(DataSet: TDataSet);
begin
  sqlQueryPadraodata_pagamento.AsDateTime:=Date();

  TFinanceiroService.validarDados(dataSet);

  inherited;
end;

{******************** MÉTODOS PRIVADOS **************************}

procedure TfrmRegistrarPagamento.validarCampoVazio;
var
  codigoAluno: string;
begin
  codigoAluno := edtCodigoAluno.Text;
  if codigoAluno.Trim.Length = 0 then
  begin
    edtCodigoAluno.SetFocus;
    raise Exception.Create('Informe o código do aluno!');
  end;
end;

procedure TfrmRegistrarPagamento.atualizarDadosAluno;
begin
  mostrarDadosAluno(true);

  lblNomeAlunoFrente.Caption:=aluno.nome;
  lblNomeAlunoFundo.Caption:=aluno.nome;
end;

procedure TfrmRegistrarPagamento.mostrarDadosAluno(mostrar: boolean);
begin
  lblNomeAlunoFrente.Visible:=mostrar;
  lblNomeAlunoFundo.Visible:=mostrar;
  pnlDados.Visible:=mostrar;
  pnlNav.Visible:=mostrar;
end;

end.

