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
    btnExcluir: TBitBtn;
    DBGrid1: TDBGrid;
    dblTurma: TDBLookupComboBox;
    dsTurma_Aluno: TDataSource;
    lblTextoConsulta: TLabel;
    Panel1: TPanel;
    pnlEditar: TPanel;
    procedure btnConsultarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var {%H-}CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    fCodigoAluno: integer;
    procedure habilitarBotoes;
    procedure abrirTurmas;
  public
    class function abrirConsultaTurma(): integer;
  end;

var
  frmConsultaTurma: TfrmConsultaTurma;

implementation

uses
  uDATMOD, uTurma_Aluno, uTurmaService;

{$R *.lfm}

{ TfrmConsultaTurma }

procedure TfrmConsultaTurma.abrirTurmas;
begin
  DataModuleApp.qryLookUpTurma.Open;
  dblTurma.ItemIndex := 0;
end;

procedure TfrmConsultaTurma.FormShow(Sender: TObject);
begin
  inherited;
  abrirTurmas;
  DataModuleApp.qryTurmaObj.ServerFiltered:=true;
end;

procedure TfrmConsultaTurma.habilitarBotoes;
begin
  btnEditar.Enabled := DataModuleApp.qryTurmaObj.Active and (not DataModuleApp.qryTurmaObj.IsEmpty);
  btnExcluir.Enabled := DataModuleApp.qryTurmaObj.Active and (not DataModuleApp.qryTurmaObj.IsEmpty);
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
var
  turma: string;
begin
  turma := dblTurma.Text;
  if (dblTurma.KeyValue = -1) or (turma.Trim.Length = 0) then
    raise Exception.Create('Informe a turma!');

  DataModuleApp.qryTurmaObj.Close;
  DataModuleApp.qryTurmaObj.ServerFilter := 'fk_turma_id = ' + VarToStr(DataModuleApp.qryLookUpTurmaid.AsString);
  DataModuleApp.qryTurmaObj.Open;

  habilitarBotoes;
  if DataModuleApp.qryTurmaObj.IsEmpty then
    raise Exception.Create('Não existem alunos relacionados à turma.');
end;

procedure TfrmConsultaTurma.btnEditarClick(Sender: TObject);
begin
  with TfrmGerenciarTurma.Create(Application) do
  try
    chamadoPor := cpConsulta_Turma;

    sqlQueryPadrao.ServerFilter := 'fk_turma_id = ' + DataModuleApp.qryTurmaObjfk_turma_id.AsString;
    sqlQueryPadrao.Open;
    idTurma := DataModuleApp.qryTurmaObjfk_turma_id.AsInteger;
    ShowModal;
  finally
    abrirTurmas;
    sqlQueryPadrao.ServerFilter := '';
    DataModuleApp.qryTurmaObj.Close;
    Free;
  end;
end;

procedure TfrmConsultaTurma.btnExcluirClick(Sender: TObject);
begin
  with dsTurma_Aluno.DataSet do
    TTurmaService.excluirAluno(FieldByName('fk_aluno_id').AsInteger, FieldByName('fk_turma_id').AsInteger);
  btnConsultar.Click;
end;

end.

