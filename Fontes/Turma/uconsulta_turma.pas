unit uconsulta_turma;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, StdCtrls, DBGrids, DbCtrls, uFormBase, Variants;

type

  { TfrmConsultaTurma }

  TfrmConsultaTurma = class(TfrmBase)
    btnConsultar: TBitBtn;
    btnEditar: TBitBtn;
    DBGrid1: TDBGrid;
    dblTurma: TDBLookupComboBox;
    dsTurma_Aluno: TDataSource;
    lblTextoConsulta: TLabel;
    Panel1: TPanel;
    pnlEditar: TPanel;
    StaticText1: TStaticText;
    procedure btnConsultarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var {%H-}CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    fCodigoAluno: integer;
  public
    class function abrirConsultaTurma(): integer;
  end;

var
  frmConsultaTurma: TfrmConsultaTurma;

implementation

uses
  uDATMOD, uTurma_Aluno;

{$R *.lfm}

{ TfrmConsultaTurma }

procedure TfrmConsultaTurma.FormShow(Sender: TObject);
begin
  DataModuleApp.qryLookUpTurma.Open;
  dblTurma.ItemIndex := 0;
  DataModuleApp.qryTurmaObj.ServerFiltered:=true;
end;


procedure TfrmConsultaTurma.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DataModuleApp.qryLookUpTurma.Close;
  DataModuleApp.qryTurmaObj.Close;
  DataModuleApp.qryTurmaObj.ServerFiltered:=false;
end;

class function TfrmConsultaTurma.abrirConsultaTurma(): integer;
begin
  with TfrmConsultaTurma.Create(Application) do
  try
    fCodigoAluno := 0;
    ShowModal;
  finally
    Result := fCodigoAluno;
    Free;
  end;
end;

procedure TfrmConsultaTurma.btnConsultarClick(Sender: TObject);
begin
  if dblTurma.KeyValue = -1 then
    raise Exception.Create('Informe a turma!');

  DataModuleApp.qryTurmaObj.Close;
  DataModuleApp.qryTurmaObj.ServerFilter := 'fk_turma_id = ' + VarToStr(dblTurma.KeyValue);
  DataModuleApp.qryTurmaObj.Open;

  btnEditar.Enabled := not DataModuleApp.qryTurmaObj.IsEmpty;

  if DataModuleApp.qryTurmaObj.IsEmpty then
    raise Exception.Create('Não existem alunos relacionados à turma.');
end;

procedure TfrmConsultaTurma.btnEditarClick(Sender: TObject);
begin
  with TfrmGerenciarTurma.Create(Application) do
  try
    sqlQueryPadrao.ServerFilter := 'fk_turma_id = ' + dsTurma_Aluno.DataSet.FieldByName('fk_turma_id').AsString + 'fk_aluno_id = ' + dsTurma_Aluno.DataSet.FieldByName('fk_aluno_id').AsString;
    sqlQueryPadrao.Open;
    ShowModal;
  finally
    sqlQueryPadrao.ServerFilter := '';
    Free;
  end;
end;

end.

