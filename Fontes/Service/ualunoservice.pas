unit uAlunoService;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uFinanceiroService, sqldb, Forms, LCLType, uAluno;

type

  TAlunoService = class
  private
    dataSet: TSQLQuery;
    financeiroService: TFinanceiroService;
  public
    // O parâmetro dataSetAluno idica um DataSet com as informações de um aluno.
    constructor create(dataSetAluno: TSQLQuery);
    destructor destroy; override;

    // retorna um objecto aluno a partir do id. Caso não seja encontrado, retornará nil.
    class function obterAluno(id: integer): TAluno;

    // Identifica se existe responsável cadatrado ao aluno
    function temResponsavel: boolean;

    // Aplica as regras de validação referentes à inclusão do aluno.
    procedure validarDados;


    property financeiro: TFinanceiroService read financeiroService;
  end;

implementation

uses
  uDATMOD;

//******************** MÉTODOS PÚBLICOS ********************//
constructor TAlunoService.create(dataSetAluno: TSQLQuery);
begin
  dataSet := dataSetAluno;
  financeiroService := TFinanceiroService.create(dataSetAluno);
end;

destructor TAlunoService.destroy;
begin
  financeiroService.Free;
  Self.dataSet := nil;
end;


function TAlunoService.temResponsavel: boolean;
var
  qry: TSQLQuery;
begin
  result := dataSet.IsEmpty;
  if not Result then
  begin
    qry := TSQLQuery.Create(nil);
    qry.SQLConnection := dataSet.SQLConnection;
    try
      qry.SQL.Add('select count(*) from responsavel where fk_aluno_id = ' + dataSet.FieldByName('id').AsString);
      qry.Open;
      result := (qry.Fields[0].AsInteger > 0);
    finally
      qry.Close;
      qry.Free;
    end;
  end;
end;

procedure TAlunoService.validarDados;
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

//******************** MÉTODOS DE CLASSE PÚBLICOS ********************//
class function TAlunoService.obterAluno(id: integer): TAluno;
{var
  qry: TSQLQuery;}
begin
  result := nil;
{  qry := TSQLQuery.Create(nil);
  qry.SQLConnection := DataModuleApp.MySQL57Connection;}

  try
{    qry.SQL.Add('seletc id, nome, data_nascimento, data_cadastramento, data_inativacao, fk_motivo_matricula_id, fk_doenca_pre_existente_id from aluno where id = ' + id.ToString);
    qry.Open;}

    DataModuleApp.qryAlunoObj.Close;
    DataModuleApp.qryAlunoObj.ServerFilter:='id = ' + id.ToString;
    DataModuleApp.qryAlunoObj.ServerFiltered:=true;
    DataModuleApp.qryAlunoObj.Open;

    //if not qry.IsEmpty then
    if not DataModuleApp.qryAlunoObj.IsEmpty then
    begin
      result := TAluno.create(DataModuleApp.qryAlunoObj);

{      result := TAluno.create(qry.FieldByName('id').AsInteger,
                              qry.FieldByName('nome').AsString,
                              qry.FieldByName('data_nascimento').AsDateTime,
                              qry.FieldByName('data_cadastramento').AsDateTime,
                              qry.FieldByName('data_inativacao').AsDateTime,
                              qry.FieldByName('fk_motivo_matricula_id').AsInteger,
                              qry.FieldByName('fk_doenca_pre_existente_id').AsInteger);}
    end;
  finally
    DataModuleApp.qryAlunoObj.Close;
{    qry.Close;
    qry.Free;}
  end;
end;

//******************** MÉTODOS PRIVADOS ********************//

end.
