unit uDATMOD;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql57conn, sqldb, db, FileUtil;

type

  { TDataModuleApp }

  TDataModuleApp = class(TDataModule)
    dsLookUpAluno: TDataSource;
    dsqryLookUpTurma: TDataSource;
    dsqryLookUpPerfilUsuario: TDataSource;
    dsMotivo_Matricula: TDataSource;
    dsDoenca_Pre_Existente: TDataSource;
    dsqryLookUpProfessor: TDataSource;
    MySQL57Connection: TMySQL57Connection;
    qryAlunoObj: TSQLQuery;
    qryLookUpDoenca_Pre_Existenteid: TLargeintField;
    qryLookUpDoenca_Pre_ExistenteNome: TStringField;
    qryLookUpMotivo_Matricula: TSQLQuery;
    qryLookUpDoenca_Pre_Existente: TSQLQuery;
    qryLookUpMotivo_Matriculadescricao: TStringField;
    qryLookUpMotivo_Matriculaid: TLargeintField;
    qryLookUpProfessor: TSQLQuery;
    qryUsuarioObj: TSQLQuery;
    qryLookUpPerfilUsuario: TSQLQuery;
    qryLookUpTurma: TSQLQuery;
    qryTurmaObj: TSQLQuery;
    qryLookUpAluno: TSQLQuery;
    sqlTransactionGeral: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure SQLQueryObjAfterClose(DataSet: TDataSet);
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

procedure TDataModuleApp.SQLQueryObjAfterClose(DataSet: TDataSet);
begin
  TSQLQuery(DataSet).ServerFilter := '';
  TSQLQuery(DataSet).ServerFiltered := false;
end;

end.

