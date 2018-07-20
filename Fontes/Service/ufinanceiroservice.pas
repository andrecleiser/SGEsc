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
    class function alunoAdimplente(aluno: TAluno): boolean;
    class procedure validarAluno(aluno: TAluno; var idTurma: integer);

//    class function alunoAdimplente(idAluno: Integer): boolean; overload;
  end;


implementation
uses
  uTurmaService;

class function TFinanceiroService.alunoAdimplente(aluno: TAluno): boolean;
begin
  result := aluno.adimplente = 'S';
end;

class procedure TFinanceiroService.validarAluno(aluno: TAluno; var idTurma: integer);
begin
  if aluno.data_inativacao = 0 then
    raise Exception.Create('Aluno inativo!');

  // Validar se o aluno está matriculado em alguma turma
  if not TTurmaService.alunoAptoTurma(aluno.id, idTurma) then
    raise Exception.Create('O aluno não está relacionado a nenhuma turma!');

end;

{class function TFinanceiroService.alunoAdimplente(idAluno: Integer): boolean;
begin
  result := false;
end;}

end.

