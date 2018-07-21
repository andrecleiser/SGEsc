unit uFinanceiroService;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, uAluno, db, Forms, LCLType, DateUtils;

type
  TFinanceiroService = class

  private

  public
    // O parâmetro dataSetAluno idica um DataSet com as informações de um aluno.
    class function alunoAdimplente(aluno: TAluno): boolean;
    class procedure validarAluno(aluno: TAluno; var idTurma: integer);
    class procedure validarDados(dataSet: TDataSet);

//    class function alunoAdimplente(idAluno: Integer): boolean; overload;
  end;


implementation
uses
  uTurmaService, uDATMOD;

class function TFinanceiroService.alunoAdimplente(aluno: TAluno): boolean;
begin
  result := aluno.adimplente = 'S';
end;

class procedure TFinanceiroService.validarAluno(aluno: TAluno; var idTurma: integer);
var
  idTurma;
begin
  if aluno.data_inativacao > 0 then
    raise Exception.Create('Aluno inativo!');

  // Validar se o aluno está matriculado em alguma turma
  if not TTurmaService.alunoAptoTurma(aluno.id, idTurma) then
    raise Exception.Create('O aluno não está relacionado a nenhuma turma!');
end;

{class function TFinanceiroService.alunoAdimplente(idAluno: Integer): boolean;
begin
  result := false;
end;}

class procedure TFinanceiroService.validarDados(dataSet: TDataSet);
begin
  // Regra de validação 10
  if dataSet.FieldByName('valor').IsNull or (dataSet.FieldByName('valor').AsFloat <= 0) then
    raise Exception.Create('O valor do pagamento tem que ser maior do que zero.');

  // Regra de validação 03
  if dataSet.FieldByName('valor').AsFloat <> DataModuleApp.qryLookUpTurmavalor_sugerido.AsFloat then
    if Application.MessageBox('O valor informado não está de acordo com o registrado na turma. Deseja continuar?”', 'Validação', MB_ICONQUESTION + MB_YESNO) = IDNO then
      raise Exception.Create('Registro de pagamento cancelado!');

  // Regra de validação 04
  if dataSet.FieldByName('mes').IsNull or (not ((dataSet.FieldByName('mes').AsInteger >= 1) and (dataSet.FieldByName('mes').AsInteger <= 12)) ) then
    raise Exception.Create('Mês deve estar entre 1 e 12!');

  // Regra de validação 09
  if dataSet.FieldByName('valor').IsNull or (dataSet.FieldByName('valor').AsFloat <= 0) then
    raise Exception.Create('O valor do pagamento tem que ser maior do que zero.');

  // Regra de validação 05
  if Application.MessageBox('O valor informado não está de acordo com o registrado na turma. Deseja continuar?”', 'Validação', MB_ICONQUESTION + MB_YESNO) = IDNO then
    raise Exception.Create('Registro de pagamento cancelado!');

  // Regra de validação 10                                           // Tempo aproximado a prescrição.
  if dataSet.FieldByName('ano').IsNull or (dataSet.FieldByName('ano').AsFloat < (YearOf(Date() - 5))) then
    raise Exception.Create('Ano do pagamento inválido.');

  // Regra de validação 11
  if dataSet.FieldByName('ano').AsFloat >= (YearOf(Date() + 1)) then
    raise Exception.Create('O ano do pagamento não pode ser superior ao corrente!');
end;

end.

