unit uResponsavelService;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, db, LCLType;

type

  TResponsavelService = class
  private
  public
    // Aplica as regras de validação referentes à inclusão do aluno.
    class procedure validarDados(dataSet: TDataSet);
  end;

implementation

uses
  uClassUtil;

//******************** MÉTODOS PÚBLICOS ********************//
class procedure TResponsavelService.validarDados(dataSet: TDataSet);
begin
  // Regra de validação 01
  if dataSet.FieldByName('nome').AsString.Trim.Length < 10 then
    raise Exception.Create('O nome do responsável deve conter entre 10 e 70 caracteres.');

  // Regra de validação 02
  if dataSet.FieldByName('email').AsString.Trim.Length < 10 then
    raise Exception.Create('O e-mail do responsável deve conter entre 10 e 40 caracteres.');

  // Regra de validação 03
  if dataSet.FieldByName('cpf').AsString.Trim.Length = 0  then
    raise Exception.Create('O C.P.F. do responsável tem que ser informado.');

  // Regra de validação 04
  if dataSet.FieldByName('celular').AsString.Trim.Length = 0  then
    raise Exception.Create('O celular do responsável tem que ser informado.');

  // Regra de validação 05
  TUtil.CheckCPF(dataSet.FieldByName('cpf').AsString);

  // Regra de validação 06
  TUtil.validar_Email(dataSet.FieldByName('email').AsString);

  // Regra de validação 07
  if dataSet.FieldByName('celular').AsString.Trim.Length <> 11 then
    raise Exception.Create('O celular do responsável tem que ter 11 dígitos.');
end;

//******************** MÉTODOS PRIVADOS ********************//

end.
