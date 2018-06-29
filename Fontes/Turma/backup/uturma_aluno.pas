unit uTurma_Aluno;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, FileUtil, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, DbCtrls, StdCtrls, uCadastroPadrao;

type

  { TfrmGerenciarTurma }

  TfrmGerenciarTurma = class(TfrmCadastroPadrao)
    DBLookupComboBox1: TDBLookupComboBox;
    dbLookupComboBoxTurma: TDBLookupComboBox;
    labelTurma: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var {%H-}CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure afterScrollTurma(DataSet: TDataSet);
    procedure sqlQueryPadraoBeforePost(DataSet: TDataSet);
  private
    afterScrollLookUpTurma: TDataSetNotifyEvent;

  public

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
  dbLookupComboBoxTurma.ListSource.DataSet.AfterScroll := afterScrollLookUpTurma;
end;

procedure TfrmGerenciarTurma.FormCreate(Sender: TObject);
begin
  captionForm := 'Gerenciamento da turma';
  inherited;
  afterScrollLookUpTurma := dbLookupComboBoxTurma.ListSource.DataSet.AfterScroll;
  dbLookupComboBoxTurma.ListSource.DataSet.AfterScroll := afterScrollTurma;
end;

procedure TfrmGerenciarTurma.FormShow(Sender: TObject);
begin
  DataModuleApp.qryLookUpTurma.Open;
  DataModuleApp.qryLookUpAluno.Open;
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

