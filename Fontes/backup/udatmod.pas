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
    qryAlunoObj: TSQLQuery;
    qryLookUpDoenca_Pre_Existenteid: TLargeintField;
    qryLookUpDoenca_Pre_ExistenteNome: TStringField;
    qryLookUpMotivo_Matricula: TSQLQuery;
    qryLookUpDoenca_Pre_Existente: TSQLQuery;
    qryLookUpMotivo_Matriculadescricao: TStringField;
    qryLookUpMotivo_Matriculaid: TLargeintField;
    sqlTransactionGeral: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure qryAlunoObjAfterClose({%H-}DataSet: TDataSet);
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

procedure TDataModuleApp.qryAlunoObjAfterClose(DataSet: TDataSet);
begin
  qryAlunoObj.ServerFilter:='';
  qryAlunoObj.ServerFiltered:=false;
end;

end.

