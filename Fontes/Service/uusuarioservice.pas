unit uUsuarioService;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uUsuario, db;

type
  TUsuarioService = class
  private
  public
    // retorna um objeto usuário a partir do id. Caso não seja encontrado, retornará nil.
    class function obterUsuario(id: integer): TUsuario; overload;

    // retorna um objeto usuário a partir do regsitro corrente do DataSet.
    class function obterUsuario(dataSet: TDataSet): TUsuario; overload;

    // Aplica as regras de validação referentes à inclusão do usuário.
    class procedure validarDados(dataSet: TDataSet);

    // Valida o usuário.
    class procedure validarUsuario(pusuario: TUsuario);

  end;


implementation

uses
  uDATMOD, base64;

class function TUsuarioService.obterUsuario(id: integer): TUsuario;
begin
  Result := nil;
end;

class function TUsuarioService.obterUsuario(dataSet: TDataSet): TUsuario;
begin
  Result := nil;
end;

class procedure TUsuarioService.validarUsuario(pusuario: TUsuario);
begin
  // Regra de validação 01
  if pusuario.login.Trim.Length = 0 then
    raise Exception.Create('Informe o login do usuário.');

  // Regra de validação 02
  if pusuario.senha.Trim.Length = 0 then
    raise Exception.Create('Informe a senha do usuário.');

  with DataModuleApp.qryUsuarioObj do
  try
    ServerFilter:='login = ' + QuotedStr(pusuario.login) + ' and ativo = ''S'' ';
    ServerFiltered:=true;
    Open;

    // Regra de validação 03
    if IsEmpty then
      raise Exception.Create('Acesso não permitido ao usuário.');

    // Regra de validação 03
    if DecodeStringBase64(FieldByName('senha').AsString) <> pusuario.senha then
      raise Exception.Create('Senha informada não é válida.');

    // Atualizo obj "usuario" com os dados obtidos
    pusuario.setUsuario(DataModuleApp.qryUsuarioObj);
  finally
    Close;
  end;
end;

class procedure TUsuarioService.validarDados(dataSet: TDataSet);
begin
  // Regra de validação 01
  if dataSet.FieldByName('login').IsNull or (dataSet.FieldByName('login').AsString.Trim.Length < 5) or (dataSet.FieldByName('login').AsString.Trim.Length > 15) then
    raise Exception.Create('O login do usuário deve conter entre 5 e 15 caracteres.');

  // Regra de validação 02
  if dataSet.FieldByName('nome').IsNull or (dataSet.FieldByName('nome').AsString.Trim.Length < 5) or (dataSet.FieldByName('nome').AsString.Trim.Length > 15) then
    raise Exception.Create('O nome do usuário deve conter entre 10 e 70 caracteres.');

  // Regra de validação 03
  if dataSet.FieldByName('fk_perfil_usuario_id').IsNull then
    raise Exception.Create('O usuário precisa estar relacionado a um perfil.');

  // Regra de validação 04
  if dataSet.FieldByName('senha').IsNull or (dataSet.FieldByName('senha').AsString.Trim.Length < 6) or (dataSet.FieldByName('senha').AsString.Trim.Length > 15) then
    raise Exception.Create('A senha do usuário deve conter entre 6 e 15 caracteres.');

  // Regra de validação 05
  with DataModuleApp.qryUsuarioObj do
  try
    ServerFilter:='login = ' + QuotedStr(dataSet.FieldByName('login').AsString);
    ServerFiltered:=true;
    Open;

    if (not IsEmpty) and (FieldByName('id').AsInteger <> dataSet.FieldByName('id').AsInteger) then
      raise Exception.Create('O login informado já existe.');
  finally
    Close;
  end;
end;

end.



































