unit uFinanceiroService;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, uAluno, db, Forms, LCLType, DateUtils;

type
  TFinanceiroService = class

  private
    class function estaInadimplente(idAluno: integer; idTurma: integer; dia_vencimento: integer): boolean;

  public
    class procedure validarAluno(aluno: TAluno; var idTurmas: string);
    class procedure validarDados(dataSet: TDataSet);

    // retorna a quantidade de alunos inadimplentes
    class function totalAlunoInadimplente(): integer;

    class function alunoAdimplente(aluno: TAluno; idTurma: integer): boolean;
  end;


implementation
uses
  uAlunoService, uDATMOD;

class function TFinanceiroService.alunoAdimplente(aluno: TAluno; idTurma: integer): boolean;
begin
  result := TFinanceiroService.estaInadimplente(aluno.id, idTurma, aluno.dia_vencimento);
  if result then
    aluno.adimplente := 'N'
  else
    aluno.adimplente := 'S';
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

class procedure TFinanceiroService.validarDados(dataSet: TDataSet);
var
  sql: TSQLQuery;
begin
  // Regra de validação 12
  if dataSet.FieldByName('fk_turma_id').IsNull or (dataSet.FieldByName('fk_turma_id').AsFloat <= 0) then
    raise Exception.Create('A turma deve ser informada.');

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

class function TFinanceiroService.totalAlunoInadimplente(): integer;
var
  sql: TSQLQuery;
begin
  result := 0;

  sql := TSQLQuery.Create(nil);
  sql.SQLConnection := DataModuleApp.MySQL57Connection;
  sql.SQL.Add('select a.id,');
  sql.SQL.Add('       ta.fk_turma_id,');
  sql.SQL.Add('       a.dia_vencimento');
  sql.SQL.Add('from   aluno a');
  sql.SQL.Add('       left join turma_aluno ta on (a.id = ta.fk_aluno_id)');
  sql.SQL.Add('where  a.data_inativacao is null');

  try
    sql.Open;
    sql.DisableControls;
    while not sql.EOF do
    begin
      if not TFinanceiroService
         .estaInadimplente(sql.Fields[0].AsInteger,
                           sql.Fields[1].AsInteger,
                           sql.Fields[2].AsInteger) then
        Inc(result);
      sql.Next;
    end;
  finally
    sql.Close;
    sql.Free;
  end;
end;

//******************** MÉTODOS PRIVADOS ********************//
class function TFinanceiroService.estaInadimplente(idAluno: integer; idTurma: integer; dia_vencimento: integer): boolean;
var
  sql: TSQLQuery;
  vencimento: TDateTime;
begin
  // Sem dia de vencimento será considerado inadimplente

  // Corrigi aos meses 30 vencimento for 31 e fevereiro quando 28, 29, 30 ou 31.
  if (dia_vencimento > DaysInMonth(Today())) then
    dia_vencimento := DaysInMonth(Today());

  sql := TSQLQuery.Create(nil);
  sql.SQLConnection := DataModuleApp.MySQL57Connection;
  sql.SQL.Add('select max(mes), ano');
  sql.SQL.Add('from pagamento');
  sql.SQL.Add('where ano = year(current_date())');
  sql.SQL.Add('  and fk_aluno_id = ' + idAluno.ToString());
  sql.SQL.Add('  and fk_turma_id = ' + idTurma.ToString());

  try
    sql.Open;

    // Pagamento ncontrado no ano/mês antetior ao mês corrente.
    result := (not sql.IsEmpty) and
              (
               (sql.Fields[1].AsInteger = YearOf( IncMonth(Today(), -1) )) and
               (sql.Fields[0].AsInteger = MonthOf( IncMonth(Today(), -1) ))
              );
  finally
    sql.Close;
    sql.Free;
  end;

  vencimento := EncodeDate(YearOf(Today()), MonthOf(Today()), dia_vencimento);
  // Pagamento no mês anterior e dia corrente menor do que o dia do vencimento do aluno
  result := result and (DaysBetween(Today(), vencimento) >= 0);
end;

end.

