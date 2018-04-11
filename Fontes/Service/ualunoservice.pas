unit uAlunoService;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, Forms, LCLType, uAluno;

type

  TAlunoService = class
  private
  public
    // retorna um objeto aluno a partir do id. Caso não seja encontrado, retornará nil.
    class function obterAlunoAtivo(id: integer): TAluno;

    // retorna um objeto aluno a partir do regsitro corrente do DataSet.
//    class function obterAluno(dataSet: TSQLQuery): TAluno; overload;

    // Identifica se existe responsável cadatrado ao aluno
    class function temResponsavel(idAluno: integer): boolean;

    // Aplica as regras de validação referentes à inclusão do aluno.
    class procedure validarDados(dataSet: TDataSet);
  end;

implementation

uses
  uDATMOD;

//******************** MÉTODOS PÚBLICOS ********************//
{class function TAlunoService.obterAluno(dataSet: TSQLQuery): TAluno;
begin
  result := TAluno.create(dataSet);
end;
}

class function TAlunoService.temResponsavel(idAluno: integer): boolean;
var
  qry: TSQLQuery;
begin
  qry := TSQLQuery.Create(nil);
  qry.SQLConnection := DataModuleApp.MySQL57Connection;
  try
    qry.SQL.Add('select count(*) from responsavel where fk_aluno_id = ' + idAluno.toString);
    qry.Open;
    result := (qry.Fields[0].AsInteger > 0);
  finally
    qry.Close;
    qry.Free;
  end;
end;

class procedure TAlunoService.validarDados(dataSet: TDataSet);
begin
  // Regra de validação 03
  if dataSet.FieldByName('nome').IsNull or (dataSet.FieldByName('nome').AsString.Trim.Length < 10) then
    raise Exception.Create('O nome do aluno deve conter entre 10 e 70 caracteres.');

  // Regra de validação 04
  if dataSet.FieldByName('data_nascimento').IsNull  then
    raise Exception.Create('A data de nascimento do aluno tem que ser informada.');

  // Regra de validação 05
  if Trunc(dataSet.FieldByName('data_nascimento').AsDateTime) > Date then
    raise Exception.Create('A data de nascimento do aluno não pode ser futura.');

  // Regra de validação 06
  if (dataSet.FieldByName('telefone').AsString.Trim.Length = 0) and (dataSet.FieldByName('celular').AsString.Trim.Length = 0) then
    if Application.MessageBox('Não foi informado telefone ou celular ao aluno. Deseja continuar?', 'Validação', MB_ICONQUESTION + MB_YESNO) = IDNO then
      raise Exception.Create('Atualização dos dados do aluno cancelada.');

  // Regra de validação 07
  if dataSet.FieldByName('fk_motivo_matricula_id').IsNull  then
    raise Exception.Create('Um motivo à matrícula do aluno deve ser informado.');

  // Regra de validação 08
  if dataSet.FieldByName('fk_doenca_pre_existente_id').IsNull  then
    raise Exception.Create('É necessário indicar a pré-existência de doença.');
end;

class function TAlunoService.obterAlunoAtivo(id: integer): TAluno;
begin
  result := nil;

  try
    DataModuleApp.qryAlunoObj.Close;
    DataModuleApp.qryAlunoObj.ServerFilter:='id = ' + id.ToString + ' and data_inativacao is null';
    DataModuleApp.qryAlunoObj.ServerFiltered:=true;
    DataModuleApp.qryAlunoObj.Open;

    //if not qry.IsEmpty then
    if not DataModuleApp.qryAlunoObj.IsEmpty then
    begin
      result := TAluno.create(DataModuleApp.qryAlunoObj);
    end;
  finally
    DataModuleApp.qryAlunoObj.Close;
  end;
end;

//******************** MÉTODOS PRIVADOS ********************//

end.
