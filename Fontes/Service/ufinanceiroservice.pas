unit uFinanceiroService;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, uAluno;

type
  TFinanceiroService = class

  private

  public
    // O parâmetro dataSetAluno idica um DataSet com as informações de um aluno.
    class function alunoAdimplente(aluno: TAluno): boolean; overload;
    class function alunoAdimplente(idAluno: Integer): boolean; overload;
  end;


implementation

class function TFinanceiroService.alunoAdimplente(aluno: TAluno): boolean; overload;
begin
  result := aluno.adimplente = 'S';
end;

class function TFinanceiroService.alunoAdimplente(idAluno: Integer): boolean;
begin
  result := false;
end;

end.

