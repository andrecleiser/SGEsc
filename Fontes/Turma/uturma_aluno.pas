unit uTurma_Aluno;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, FileUtil, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, DbCtrls, StdCtrls, uCadastroPadrao;

type

  { TfrmGerenciarTurma }

  TfrmGerenciarTurma = class(TfrmCadastroPadrao)
    DBLookupComboBoxAluno: TDBLookupComboBox;
    dbLookupComboBoxTurma: TDBLookupComboBox;
    Label2: TLabel;
    labelTurma: TLabel;
    pnlDados: TPanel;
    procedure dsPadraoStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var {%H-}CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure afterScrollTurma(DataSet: TDataSet);
    procedure sqlQueryPadraoAfterInsert(DataSet: TDataSet);
    procedure sqlQueryPadraoBeforePost(DataSet: TDataSet);
  private
    afterScrollLookUpTurma: TDataSetNotifyEvent;
    fidAluno: integer;

  public
    property idAluno: integer read fidAluno write fidAluno;

  end;

var
  frmGerenciarTurma: TfrmGerenciarTurma;

implementation

uses
  uDATMOD, uTurmaService;

{$R *.lfm}

{ TfrmGerenciarTurma }

procedure TfrmGerenciarTurma.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DataModuleApp.qryLookUpTurma.Close;
  DataModuleApp.qryLookUpAluno.Close;
  sqlQueryPadrao.Close;
  DataModuleApp.qryLookUpTurma.AfterScroll := afterScrollLookUpTurma;
end;

procedure TfrmGerenciarTurma.dsPadraoStateChange(Sender: TObject);
begin
  inherited;
  pnlDados.Enabled := (dsPadrao.State in [dsInsert, dsEdit]);
end;

procedure TfrmGerenciarTurma.FormCreate(Sender: TObject);
begin
  captionForm := 'Gerenciamento da turma';
  inherited;
  afterScrollLookUpTurma := DataModuleApp.qryLookUpTurma.AfterScroll;
  DataModuleApp.qryLookUpTurma.AfterScroll := @afterScrollTurma;
  fidAluno := 0;
end;

procedure TfrmGerenciarTurma.FormShow(Sender: TObject);
begin
  DataModuleApp.qryLookUpTurma.Open;
  DataModuleApp.qryLookUpAluno.Open;

  if (fidAluno > 0) and (dsPadrao.State in [dsEdit, dsInsert]) then
  begin
    DBLookupComboBoxAluno.KeyValue := idAluno;
    sqlQueryPadrao.FieldByName('fk_aluno_id').AsInteger := idAluno;
    DBLookupComboBoxAluno.Enabled:=false;
  end;
end;

procedure TfrmGerenciarTurma.afterScrollTurma(DataSet: TDataSet);
begin
  if Assigned(afterScrollLookUpTurma) then
    afterScrollLookUpTurma(DataSet);

  labelTurma.Caption := 'Turma | Quantidade limite de alunos: ' +
                        dbLookupComboBoxTurma.ListSource.DataSet.FieldByName('limite_alunos').AsString +
                        ' |  Quantidade de alunos matriculados: ' +
                        dbLookupComboBoxTurma.ListSource.DataSet.FieldByName('qtd_alunos_turma').AsString;
end;

procedure TfrmGerenciarTurma.sqlQueryPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  sqlQueryPadrao.FieldByName('fk_aluno_id').AsInteger := idAluno;
end;

procedure TfrmGerenciarTurma.sqlQueryPadraoBeforePost(DataSet: TDataSet);
begin
  TTurmaService.validarTurmaAluno(DataSet);
  inherited;
end;

end.

