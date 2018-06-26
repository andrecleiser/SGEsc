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
    DBLookupComboBox2: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var {%H-}CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  frmGerenciarTurma: TfrmGerenciarTurma;

implementation

uses
  uDATMOD;

{$R *.lfm}

{ TfrmGerenciarTurma }

procedure TfrmGerenciarTurma.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DataModuleApp.qryLookUpTurma.Close;
  DataModuleApp.qryLookUpAluno.Close;
  sqlQueryPadrao.Close;
end;

procedure TfrmGerenciarTurma.FormCreate(Sender: TObject);
begin
  captionForm := 'Gerenciamento da turma';
  inherited;
end;

procedure TfrmGerenciarTurma.FormShow(Sender: TObject);
begin
  DataModuleApp.qryLookUpTurma.Open;
  DataModuleApp.qryLookUpAluno.Open;
end;

end.

