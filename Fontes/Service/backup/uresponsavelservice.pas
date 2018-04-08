unit uResponsavelService;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, sqldb, LCLType;

type

  TResponsavelService = class
  private
    dataSet: TSQLQuery;
  public
    // O parâmetro dataSetAluno idica um DataSet com as informações de um aluno.
    constructor create(dataSetResponsavel: TSQLQuery);
    destructor destroy; override;

    // Aplica as regras de validação referentes à inclusão do aluno.
    procedure validarDados;
  end;

implementation

uses
  uClassUtil;

//******************** MÉTODOS PÚBLICOS ********************//
constructor TResponsavelService.create(dataSetResponsavel: TSQLQuery);
begin
  dataSet := dataSetResponsavel;
end;

destructor TResponsavelService.destroy;
begin
  Self.dataSet := nil;
end;

procedure TResponsavelService.validarDados;
begin
  // Regra de validação 01
  if dataSet.FieldByName('nome').IsNull or (dataSet.FieldByName('nome').AsString.Length < 10) then
    raise Exception.Create('O nome do responsável deve conter entre 10 e 70 caracteres.');

  // Regra de validação 02
  if dataSet.FieldByName('email').IsNull or (dataSet.FieldByName('email').AsString.Length < 10) then
    raise Exception.Create('O e-mail do responsável deve conter entre 10 e 70 caracteres.');

  // Regra de validação 03
  if dataSet.FieldByName('cpf').IsNull  then
    raise Exception.Create('O C.P.F. do responsável tem que ser informado.');

  // Regra de validação 04
  if dataSet.FieldByName('celular').IsNull  then
    raise Exception.Create('O celular do responsável tem que ser informado.');

  // Regra de validação 05
  TUtil.CheckCPF(dataSet.FieldByName('cpf').AsString);

  // Regra de validação 06
  TUtil.validar_Email(dataSet.FieldByName('email').AsString);

end;

//******************** MÉTODOS PRIVADOS ********************//

end.
