unit uFinanceiroService;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb;

type
  TFinanceiroService = class

  private
    dataSet: TSQLQuery;

  public
    // O parâmetro dataSetAluno idica um DataSet com as informações de um aluno.
    constructor create(dataSetAluno: TSQLQuery);
    destructor destroy; override;

    function alunoAdimplente: boolean; overload;
    class function alunoAdimplente(idAluno: Integer): boolean; overload;
  end;


implementation

constructor TFinanceiroService.create(dataSetAluno: TSQLQuery);
begin
  dataSet := dataSetAluno;
end;

destructor TFinanceiroService.destroy;
begin
  dataSet := nil;
end;

function TFinanceiroService.alunoAdimplente: boolean;
begin
  result := false;
end;

class function TFinanceiroService.alunoAdimplente(idAluno: Integer): boolean;
begin
  result := false;
end;

end.

