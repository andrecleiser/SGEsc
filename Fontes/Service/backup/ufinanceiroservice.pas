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

    function alunoAdimplente: String; overload;
    class function alunoAdimplente(idAluno: Integer): String; overload;
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

function TFinanceiroService.alunoAdimplente: String;
begin
  result := 'N';
end;

class function TFinanceiroService.alunoAdimplente(idAluno: Integer): String;
begin
  result := 'N';
end;

end.

