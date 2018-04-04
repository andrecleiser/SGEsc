unit uCadAluno;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BufDataset, db, sqldb, FileUtil, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, DbCtrls, ComCtrls, StdCtrls,
  Buttons, uDATMOD;

type

  { TfrmCadAluno }

  TfrmCadAluno = class(TForm)
    Button1: TButton;
    dbNavAlunos: TDBNavigator;
    dsAluno: TDataSource;
    Panel1: TPanel;
    Panel3: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private

  public

  end;

var
  frmCadAluno: TfrmCadAluno;

implementation

{$R *.lfm}

{ TfrmCadAluno }

procedure TfrmCadAluno.FormCreate(Sender: TObject);
begin
  DataModuleApp.sqlQueryAlunos.Open;
end;

procedure TfrmCadAluno.Button1Click(Sender: TObject);
begin
  DataModuleApp.sqlQueryAlunos.ApplyUpdates;
  DataModuleApp.sqlQueryAlunos.SQLTransaction.CommitRetaining;
end;

procedure TfrmCadAluno.FormDestroy(Sender: TObject);
begin
  DataModuleApp.sqlQueryAlunos.Close;
end;

end.
