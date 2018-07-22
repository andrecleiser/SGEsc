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
    class procedure validarAluno(aluno: TAluno; var idTurmas: string);
    class procedure validarDados(dataSet: TDataSet);

//    class function alunoAdimplente(idAluno: Integer): boolean; overload;
  end;


implementation
uses
  uAlunoService, uDATMOD;

class function TFinanceiroService.alunoAdimplente(aluno: TAluno): boolean;
begin
  result := aluno.adimplente = 'S';
end;

class procedure TFinanceiroService.validarAluno(aluno: TAluno; var idTurmas: string);
begin
  if aluno.data_inativacao > 0 then
    raise Exception.Create('Aluno inativo!');

  idTurmas := TAlunoService.obterIDsTurmas(aluno.id);

  // Validar se o aluno está matriculado em alguma turma
  if idTurmas.IsEmpty then
    raise Exception.Create('O aluno não está relacionado a nenhuma turma!');
end;

{class function TFinanceiroService.alunoAdimplente(idAluno: Integer): boolean;
begin
  result := false;
end;}

class procedure TFinanceiroService.validarDados(dataSet: TDataSet);
var
  sql: TSQLQuery;
begin
  // Regra de validação 10
  if dataSet.FieldByName('valor').IsNull or (dataSet.FieldByName('valor').AsFloat <= 0) then
    raise Exception.Create('O valor do pagamento tem que ser maior do que zero.');

  // Regra de validação 03
  if dataSet.FieldByName('valor').AsFloat <> DataModuleApp.qryLookUpTurmavalor_sugerido.AsFloat then
    if Application.MessageBox('O valor informado não está de acordo com o registrado na turma. Deseja continuar?', 'Validação', MB_ICONQUESTION + MB_YESNO) = IDNO then
      raise Exception.Create('Registro de pagamento cancelado.');

  // Regra de validação 04
  if dataSet.FieldByName('mes').IsNull or (not ((dataSet.FieldByName('mes').AsInteger >= 1) and (dataSet.FieldByName('mes').AsInteger <= 12)) ) then
    raise Exception.Create('Mês deve estar entre 1 e 12.');

  // Regra de validação 09
  if dataSet.FieldByName('valor').IsNull or (dataSet.FieldByName('valor').AsFloat <= 0) then
    raise Exception.Create('O valor do pagamento tem que ser maior do que zero.');

  // Regra de validação 10                                           // Tempo aproximado a prescrição.
  if dataSet.FieldByName('ano').IsNull or (dataSet.FieldByName('ano').AsFloat < (YearOf(IncYear(Today(), - 5)))) then
    raise Exception.Create('Ano do pagamento inválido.');

  // Regra de validação 11
  if dataSet.FieldByName('ano').AsFloat >= (YearOf(IncYear(Today(), 1))) then
    raise Exception.Create('O ano do pagamento não pode ser superior ao corrente.');

  // Regra de validação 01
  if (dataSet.State = dsInsert) or
     ( (dataSet.State = dsEdit) and
       (
         (dataSet.FieldByName('fk_aluno_id').OldValue <> dataSet.FieldByName('fk_aluno_id').NewValue) or
         (dataSet.FieldByName('fk_turma_id').OldValue <> dataSet.FieldByName('fk_turma_id').NewValue) or
         (dataSet.FieldByName('ano').OldValue <> dataSet.FieldByName('ano').NewValue) or
         (dataSet.FieldByName('mes').OldValue <> dataSet.FieldByName('mes').NewValue)
       )
     ) then
  begin
    sql := TSQLQuery.Create(nil);
    sql.SQLConnection := DataModuleApp.MySQL57Connection;
    sql.SQL.Add('select count(*) from pagamento');
    sql.SQL.Add('where fk_aluno_id = ' + dataSet.FieldByName('fk_aluno_id').AsString);
    sql.SQL.Add('  and fk_turma_id = ' + dataSet.FieldByName('fk_turma_id').AsString);
    sql.SQL.Add('  and ano = ' + dataSet.FieldByName('ano').AsString);
    sql.SQL.Add('  and mes = ' + dataSet.FieldByName('mes').AsString);

    try
      sql.Open;
      if sql.Fields[0].AsInteger > 0 then
        raise Exception.Create('Registro de pagamento já efetuado.');
    finally
      sql.Close;
      sql.Free;
    end;
  end;
end;

end.

