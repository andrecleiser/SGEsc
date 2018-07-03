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
    procedure FormClose(Sender: TObject; var {%H-}CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure afterScrollTurma(DataSet: TDataSet);
    procedure sqlQueryPadraoBeforePost(DataSet: TDataSet);
  private
    afterScrollLookUpTurma: TDataSetNotifyEvent;
    fnomeAluno: string;

  public
    property nomeAluno: string read fnomeAluno write fnomeAluno;

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

procedure TfrmGerenciarTurma.FormCreate(Sender: TObject);
begin
  captionForm := 'Gerenciamento da turma';
  inherited;
  afterScrollLookUpTurma := DataModuleApp.qryLookUpTurma.AfterScroll;
  DataModuleApp.qryLookUpTurma.AfterScroll := @afterScrollTurma;
end;

procedure TfrmGerenciarTurma.FormShow(Sender: TObject);
begin
  DataModuleApp.qryLookUpTurma.Open;
  DataModuleApp.qryLookUpAluno.Open;

  if (fnomeAluno.Length > 0) and (dsPadrao.State = dsInsert) then
  begin
    DBLookupComboBoxAluno.Text := fnomeAluno;
    sqlQueryPadrao.FieldByName('fk_aluno_id').AsInteger := DBLookupComboBoxAluno.KeyValue;
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

procedure TfrmGerenciarTurma.sqlQueryPadraoBeforePost(DataSet: TDataSet);
begin
  TTurmaService.validarTurmaAluno(DataSet);
  inherited;
end;

end.

