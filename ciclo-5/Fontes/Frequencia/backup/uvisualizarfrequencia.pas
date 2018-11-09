unit uvisualizarfrequencia;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, FileUtil, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, StdCtrls, EditBtn, DBGrids, DbCtrls, uFormBase, maskutils;

type

  { TfrmVisualizarFrequencia }

  TfrmVisualizarFrequencia = class(TfrmBase)
    btnConsultarAlunoPorNome: TBitBtn;
    btnConsultarAlunoPorNome1: TBitBtn;
    dsFrequencia: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    dtpInicio: TDateEdit;
    dtpFim: TDateEdit;
    DBGrid1: TDBGrid;
    edtCodigoAluno: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    sqlFrequencia: TSQLQuery;
    sqlFrequenciadata_frequencia: TDateField;
    sqlFrequenciahora_frequencia: TStringField;
    procedure btnConsultarAlunoPorNome1Click(Sender: TObject);
    procedure btnConsultarAlunoPorNomeClick(Sender: TObject);
    procedure dtpFimButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var {%H-}CloseAction: TCloseAction);
    procedure sqlFrequenciahora_frequenciaGetText(Sender: TField;
      var aText: string; {%H-}DisplayText: Boolean);
  private

  public

  end;

var
  frmVisualizarFrequencia: TfrmVisualizarFrequencia;

implementation

uses
  uDATMOD, uconsulta_aluno;

{$R *.lfm}

{ TfrmVisualizarFrequencia }

procedure TfrmVisualizarFrequencia.btnConsultarAlunoPorNomeClick(Sender: TObject
  );
var
  codigoAluno: integer;
begin
  codigoAluno := TfrmConsultaAluno.abrirConsultaAluno([ccRetornar, ccApenasAtivos]);
  if codigoAluno > 0 then
    edtCodigoAluno.Text:=codigoAluno.ToString;
end;

procedure TfrmVisualizarFrequencia.dtpFimButtonClick(Sender: TObject);
begin
  dtpFim.DroppedDown := true;
end;

procedure TfrmVisualizarFrequencia.btnConsultarAlunoPorNome1Click(
  Sender: TObject);
var          //dd "de" mmmm "de" yyyy
  codigoAluno: string;
begin
  codigoAluno := edtCodigoAluno.Text;
  sqlFrequencia.Close;
  DataModuleApp.qryLookUpTurma.Close;
  DataModuleApp.qryLookUpTurma.ServerFilter := 'fk_aluno_id = ' + codigoAluno.Trim;
  DataModuleApp.qryLookUpTurma.ServerFiltered:=true;
  DataModuleApp.qryLookUpTurma.Open;

  sqlFrequencia.ParamByName('idAluno').AsInteger := codigoAluno.Trim.ToInteger;
  sqlFrequencia.Open;
end;

procedure TfrmVisualizarFrequencia.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DataModuleApp.qryLookUpTurma.Close;
  DataModuleApp.qryLookUpTurma.ServerFilter := '';
  DataModuleApp.qryLookUpTurma.ServerFiltered:=false;
end;

procedure TfrmVisualizarFrequencia.sqlFrequenciahora_frequenciaGetText(
  Sender: TField; var aText: string; DisplayText: Boolean);
begin
  aText := FormatMaskText('00\:00;0;', Sender.AsString);
end;

end.

