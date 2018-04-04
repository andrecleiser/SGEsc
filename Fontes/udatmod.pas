unit uDATMOD;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql57conn, sqldb, db, FileUtil;

type

  { TDataModuleApp }

  TDataModuleApp = class(TDataModule)
    dsMotivo_Matricula: TDataSource;
    dsDoenca_Pre_Existente: TDataSource;
    MySQL57Connection: TMySQL57Connection;
    sqlQueryDoenca_Pre_Existenteid: TLargeintField;
    sqlQueryDoenca_Pre_ExistenteNome: TStringField;
    sqlQueryMotivo_Matricula: TSQLQuery;
    sqlQueryDoenca_Pre_Existente: TSQLQuery;
    sqlQueryAlunos: TSQLQuery;
    sqlQueryAlunosbairro: TStringField;
    sqlQueryAlunoscelular: TStringField;
    sqlQueryAlunoscep: TStringField;
    sqlQueryAlunoscidade: TStringField;
    sqlQueryAlunosdata_nascimento: TDateField;
    sqlQueryAlunosendereco: TStringField;
    sqlQueryAlunosestado: TStringField;
    sqlQueryAlunosid: TLargeintField;
    sqlQueryAlunosnome: TStringField;
    sqlQueryAlunosnome_mae: TStringField;
    sqlQueryAlunosnome_pai: TStringField;
    sqlQueryAlunostelefone: TStringField;
    sqlQueryMotivo_Matriculadescricao: TStringField;
    sqlQueryMotivo_Matriculaid: TLargeintField;
    sqlTransactionAluno: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure SQLConnector1AfterConnect(Sender: TObject);
  private

  public

  end;

var
  DataModuleApp: TDataModuleApp;

implementation

{$R *.lfm}

{ TDataModuleApp }

procedure TDataModuleApp.DataModuleCreate(Sender: TObject);
begin
  MySQL57Connection.Connected := false;
  MySQL57Connection.Connected := true;
end;

procedure TDataModuleApp.DataModuleDestroy(Sender: TObject);
begin
  MySQL57Connection.Connected := false;
end;

procedure TDataModuleApp.SQLConnector1AfterConnect(Sender: TObject);
begin

end;

end.

