unit uAlunoService;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, Forms, LCLType, uAluno, DateUtils;

type
  TSituacaoAluno = (saTodos, saAtivo, saInativo, saAdimplente, saInadimplente);
  TSetSituacaoAluno = Set of TSituacaoAluno;
  TListAlunos: Array of TAluno;

  TAlunoService = class
  private
  public
    // retorna um objeto aluno a partir do id. Caso não seja encontrado, retornará nil.
    class function obterAluno(id: integer; pSituacaoAluno: TSetSituacaoAluno = [saTodos]): TAluno; overload;

    // retorna um objeto aluno a partir do regsitro corrente do DataSet.
    class function obterAluno(dataSet: TDataSet): TAluno; overload;

    // Aplica as regras de validação referentes à inclusão do aluno.
    class procedure validarDados(dataSet: TDataSet);

    // Torna o aluno impedido participar das aulas.
    class procedure desativarAluno(idAluno: integer);

    // Torna o aluno apto participar das aulas.
    class procedure ativarAluno(idAluno: integer);

    // Aplica as regras de validação referentes à exclusão do aluno.
    class procedure validarExclusao(dataSet: TDataSet);

end;

implementation

uses
  uDATMOD, uClassUtil;

//******************** MÉTODOS PÚBLICOS ********************//
class function TAlunoService.obterAluno(dataSet: TDataSet): TAluno;
begin
  result := TAluno.create(dataSet);
end;

class function TAlunoService.obterAluno(id: integer; pSituacaoAluno: TSetSituacaoAluno = [saTodos]): TAluno; overload;
var
  filtro: string;
begin
  result := nil;

  if saAtivo in pSituacaoAluno then
    filtro := 'data_inativacao is null and ';

  try
    DataModuleApp.qryAlunoObj.Close;
    DataModuleApp.qryAlunoObj.ServerFilter:=  filtro +' id = ' + id.ToString;

    DataModuleApp.qryAlunoObj.ServerFiltered:=true;
    DataModuleApp.qryAlunoObj.Open;

    //if not qry.IsEmpty then
    if not DataModuleApp.qryAlunoObj.IsEmpty then
      result := TAluno.create(DataModuleApp.qryAlunoObj);

    if not Assigned(result) then
      raise Exception.Create('Aluno não cadastrado ou inativo.');
  finally
    DataModuleApp.qryAlunoObj.Close;
  end;
end;

class procedure TAlunoService.desativarAluno(idAluno: integer);
begin
  if Application.MessageBox('O aluno será impedido de participar das atividades da escola. Deseja continuar?', 'Validação', MB_ICONQUESTION + MB_YESNO) = IDNO then
    raise Exception.Create('Desativação do aluno cancelada.');

  try
    DataModuleApp.MySQL57Connection.ExecuteDirect('update aluno set data_inativacao = date(now()) where id = ' + idAluno.toString);
    DataModuleApp.sqlTransactionGeral.CommitRetaining;
    Application.MessageBox('Aluno desativado com sucesso.', 'SUCESSO', MB_ICONINFORMATION);
  except
    on e: Exception do
      Application.MessageBox(PChar(TUtil.mensagemErro(e) + '.'), 'ERRO', MB_ICONERROR);
  end;
end;

class procedure TAlunoService.ativarAluno(idAluno: integer);
begin
  if Application.MessageBox('O aluno poderá participar das atividades da escola. Deseja continuar?', 'Validação', MB_ICONQUESTION + MB_YESNO) = IDNO then
    raise Exception.Create('Ativação do aluno cancelada.');

  try
    DataModuleApp.MySQL57Connection.ExecuteDirect('update aluno set data_inativacao = null where id = ' + idAluno.toString);
    DataModuleApp.sqlTransactionGeral.CommitRetaining;
    Application.MessageBox('Aluno desativado com sucesso.', 'SUCESSO', MB_ICONINFORMATION);
  except
    on e: Exception do
      Application.MessageBox(PChar(TUtil.mensagemErro(e) + '.'), 'ERRO', MB_ICONERROR);
  end;
end;

class procedure TAlunoService.validarDados(dataSet: TDataSet);
begin
  // Regra de validação 01
  if dataSet.FieldByName('nome').IsNull or (dataSet.FieldByName('nome').AsString.Trim.Length < 10) or (dataSet.FieldByName('nome').AsString.Trim.Length > 70) then
    raise Exception.Create('O nome do aluno deve conter entre 10 e 70 caracteres.');

  // Regra de validação 02
  if dataSet.FieldByName('data_nascimento').IsNull  then
    raise Exception.Create('A data de nascimento do aluno tem que ser informada.');

  // Regra de validação 03
  if Trunc(dataSet.FieldByName('data_nascimento').AsDateTime) > Date then
    raise Exception.Create('A data de nascimento do aluno não pode ser futura.');

  // Regra de validação 04
  if (dataSet.FieldByName('telefone').AsString.Trim.Length = 0) and (dataSet.FieldByName('celular').AsString.Trim.Length = 0) then
    if Application.MessageBox('Não foi informado telefone ou celular ao aluno. Deseja continuar?', 'Validação', MB_ICONQUESTION + MB_YESNO) = IDNO then
      raise Exception.Create('Atualização dos dados do aluno cancelada.');

  // Regra de validação 05
  if dataSet.FieldByName('fk_motivo_matricula_id').IsNull  then
    raise Exception.Create('Um motivo à matrícula do aluno deve ser informado.');

  // Regra de validação 06
  if dataSet.FieldByName('fk_doenca_pre_existente_id').IsNull  then
    raise Exception.Create('É necessário indicar a pré-existência de doença.');

  {************************ Validação do responsável **************************}

  // Regra de validação 08
  if YearsBetween(Trunc(Date), Trunc(dataSet.FieldByName('data_nascimento').AsDateTime)) < 18 then
  begin
    if (dataSet.FieldByName('nome_responsavel').AsString.Trim.Length < 10) or (dataSet.FieldByName('nome_responsavel').AsString.Trim.Length > 70) then
      raise Exception.Create('O nome do responsável deve conter entre 10 e 70 caracteres.');
  end;

  // Regra de validação 11
  if (dataSet.FieldByName('email_responsavel').AsString.Trim.Length < 10) or (dataSet.FieldByName('email_responsavel').AsString.Trim.Length > 40) then
    raise Exception.Create('O e-mail do responsável deve conter entre 10 e 40 caracteres.');

  // Regra de validação 12
  if dataSet.FieldByName('cpf_responsavel').AsString.Trim.Length = 0  then
    raise Exception.Create('O C.P.F. do responsável tem que ser informado.');

  // Regra de validação 09
  TUtil.validar_Email(dataSet.FieldByName('email_responsavel').AsString);

  // Regra de validação 10
  TUtil.CheckCPF(dataSet.FieldByName('cpf_responsavel').AsString);

  // Regra de validação 13
  if dataSet.FieldByName('celular_responsavel').IsNull  then
    raise Exception.Create('O celular do responsável tem que ser informado.');

  // Regra de validação 14
  if dataSet.FieldByName('celular_responsavel').AsString.Replace(' ', '').Trim.Length <> 11 then
    raise Exception.Create('O celular do responsável tem que ter 11 dígitos.');
end;

class procedure TAlunoService.validarExclusao(dataSet: TDataSet);
begin
  if dataSet.FieldByName('celular_responsavel').IsNull  then
    raise Exception.Create('O celular do responsável tem que ser informado.');

end;

//******************** MÉTODOS PRIVADOS ********************//

end.
