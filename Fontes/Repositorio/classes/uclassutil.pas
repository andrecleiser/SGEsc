unit uClassUtil;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb;

type
  TUtil = class(TObject)
  private

  public
    class function incrementaChavePrimaria(conexao: TSQLConnection; nomeTabela: String; nomeCampoChavePrimaria: String): Integer;
    class procedure validar_Email(email: string);

    class procedure CheckCPF (sCPF : String);
    class procedure CheckCGC(sCGC: String);
    class function tirarMascara(const valorCampo: String): String;

    class function mensagemErro(e: Exception): string;

  end;

implementation

const
   msgCGC_CPFInvalido ='%s Inválido !!!';

class function TUtil.incrementaChavePrimaria(conexao: TSQLConnection; nomeTabela: String; nomeCampoChavePrimaria: String): Integer;
var
  qry: TSQLQuery;
begin
  qry := TSQLQuery.Create(nil);
  qry.SQLConnection := conexao;

  try
    qry.SQL.Add('select max(' + nomeCampoChavePrimaria + ') from ' + nomeTabela);
    qry.Open;

    result := qry.Fields[0].AsInteger + 1;
  finally
    qry.Close;
    qry.Free;
  end;
end;

class procedure TUtil.validar_Email(email: string);
const
  csLetra = 'abcdefghijklmnopqrstuvwyxzABCDEFGHIJKLMNOPQRSTUVWYXZ';
  csNumero = '0123456789';
  csEspecial = '-_';
  csArrouba = '@';
  csPonto = '.';
  csDoisPontos = '..';
var
  vsiCont : Shortint;
  vsiTamanho : Shortint;
  vsiPosicaoPrimeiroArrouba : Shortint;
  vcPrimeiroCaractere : String;
  vsDominio : String;
  emailValido: boolean;

begin
  emailValido := True;
  vsiTamanho := length(email);
  vcPrimeiroCaractere := copy(email,1,1);
  vsiPosicaoPrimeiroArrouba := pos(csArrouba,email);
  vsDominio := copy(email,vsiPosicaoPrimeiroArrouba + 1, vsiTamanho - vsiPosicaoPrimeiroArrouba);

  //Verifica se não tem caracteres brancos no fim e no começo
  //Não está na especificação, mas objetiva evitar bugs
  if email <> trim(email) then emailValido := false else

  //Verifica se inicia com número
  if pos(vcPrimeiroCaractere,csNumero) > 0 then emailValido := false else

  //Verifica se contêm pelo menos um @
  if vsiPosicaoPrimeiroArrouba = 0 then emailValido := false else

  //Verifica se contêm mais de um @, é o mesmo que perguntar se existe @ no domínio
  if pos(csArrouba,vsDominio) > 0 then emailValido := false else

  //Verifica se existe pelo memos um "." após o @
  if pos(csPonto,vsDominio) = 0 then emailValido := false else

  //Verifica se existe dois pontos juntos
  if pos(csDoisPontos,email) > 0 then emailValido := false else

  //Verifica se existe algum caractere inválido
  for vsiCont := 1 to vsiTamanho do
  begin
    if pos(copy(email,vsiCont,1), (csLetra + csNumero + csEspecial + csArrouba +  csPonto)) = 0 then emailValido := false;
  end;

  if not emailValido then
   raise Exception.Create('O e-mail informado não é válido.');
end;

(******************************************************************************)
(*                         Implementação da Classe.                           *)
(******************************************************************************)

(******************************************************************************)
(*  Function   : TUtil.tirarMascaraNumeros                                           *)
(*  Descrição  : Função para retirar a mascara de conteúdo numérico           *)
(*  Parâmetro  : valorCampo, conteúdo numérico de onde será retirada a máscara*)
(*  Retorno    : valorCampo sem a máscara.                                    *)
(******************************************************************************)
class function TUtil.tirarMascara(const valorCampo: String): String;
var
  iIndice : Integer; { Indice para poder varrer a entrada }
begin
  Result := '';
  //Varre a string com o CGC/CPF p/ tirar a máscara.
  for iIndice := 1 to length(valorCampo) do
   if valorCampo[iIndice] in ['0'..'9'] then
    Result := Result + valorCampo[iIndice]; //Pega o CGC/CPF sem a máscara.
end;

(******************************************************************************)
(*  Function   : CheckCPF                                                     *)
(*  Descrição  : Função para verificar a validez do CPF                       *)
(*  Parâmetro  : sCPF - CPF p/ verificação.                                   *)
(*  Retorno    : True  => CPF valido                                          *)
(*               False => CPF inválido                                        *)
(******************************************************************************)
class procedure TUtil.CheckCPF(sCPF: String);
var
 aiDigito       : array[1..11] of integer; { Digitos do CPF }
 iIndice        : integer;                 { Indice dos digitos }
 {%H-}iErro     : integer;                 { Variavel de Erro ( string -> integer ) }
 iMultiplicador : integer;                 { Fator de Multiplicacao }
 iTotal         : integer;                 { Total para os Calculos }
 cpfValido      : boolean;

begin
  try
    //Zera o acumulador dos dígitos do CPF.
    iTotal         := 0;
    //Pega o CPF sem máscara.
    sCPF           := TUtil.tirarMascara(sCPF);
    //Usado para verificar os dígitos que estão antes do dg verificador.
    iMultiplicador := 10;
    //1º verificação do CPF.
    cpfValido := (sCPF.Length = 11);
    //Se for identidficado um erro gerar exceção.
    if not cpfValido then
      raise Exception.Create(Format(msgCGC_CPFInvalido, ['CPF']));

    //Converte o String em um Integer.
    for iIndice := 1 to 11 do Val(sCPF[iIndice], aiDigito[iIndice], iErro);
    //Acumula os dígitos do CPF.
    for iIndice := 1 to 9 do
    begin
      iTotal := iTotal + aiDigito[iIndice] * iMultiplicador;
      Dec(iMultiplicador);
    end;

    //2º verificação do CPF.
    cpfValido := ((((iTotal * 10) mod 11) = aiDigito[10]) or
                 (((iTotal * 10) mod 11) = aiDigito[10] + 10));

    //Se for identidficado um erro gerar exceção.
    if not cpfValido then
     raise Exception.Create(Format(msgCGC_CPFInvalido, ['CPF']));

    //Zera o acumulador dos dígitos do CPF.
    iTotal         := 0;
    //Usado para validação do dígito verificador.
    iMultiplicador := 11;

    //Acumula os dígitos do CPF.
    for iIndice := 1 to 10 do
    begin
      iTotal := iTotal + aiDigito[iIndice] * iMultiplicador;
      dec(iMultiplicador);
    end;

    //3º verificação do CPF.
    cpfValido := ((((iTotal * 10) mod 11) = aiDigito[11]) or
                 (((iTotal * 10) mod 11) = aiDigito[11] + 10));

    //Se for identidficado um erro gerar exceção.
    if not cpfValido then
     raise Exception.Create(Format(msgCGC_CPFInvalido, ['CPF']));
  except
    raise;
  end;
end;

(******************************************************************************)
(*  Function   : CheckCGC                                                     *)
(*  Descrição  : Função para verificar a validez do CGC                       *)
(*  Parâmetro  : sCGC - CGC p/ verificação.                                   *)
(*  Retorno    : True  => CGC valido                                          *)
(*               False => CGC inválido                                        *)
(******************************************************************************)
class procedure TUtil.CheckCGC(sCGC: String);
var
  aiDigito       : array[1..14] of integer; { Digitos do CGC }
  iTotal         : integer;                 { Total para Calculos }
  iMultiplicador : integer;                 { Fator de multiplicacao }
  iIndice        : integer;                 { Indice dos digitos }
  {%H-}iErro     : integer;                 { Variavel de Erro ( string -> integer ) }
  iDigVerif      : integer;                 { Digito para verificacao }
  cpfValido      : boolean;
begin
  try
    //Zera o acumulador dos dígitos do CGC.
    iTotal         := 0;
    //Usado para auxiliar a validação do CGC.
    iMultiplicador := 5;
    //Pega CGC sem máscara.
    sCGC          := TUtil.tirarMascara(sCGC);

    //1º verificação do CGC.
    cpfValido := (length(sCGC) = 14);
    //Se for identidficado um erro gerar exceção.
    if not cpfValido then
     raise Exception.Create(Format(msgCGC_CPFInvalido, ['CGC']));

    //Converte o String em um Integer.
    for iIndice := 1 to 14 do
      Val(sCGC[iIndice], aiDigito[iIndice], iErro);

    //Acumula os dígitos do CGC.
    for iIndice := 1 to 12 do
    begin
      iTotal := iTotal + aiDigito[iIndice] * iMultiplicador;
      if (iMultiplicador = 2) then iMultiplicador := 9 else dec(iMultiplicador);
    end;

    //Pega o dígito verificador(Início)
    if (iTotal < 11) then iTotal := iTotal * 10;

    if (((iTotal mod 11) = 1) or ((iTotal mod 11) = 0)) then
      iDigVerif := 0
    else
      iDigVerif := 11 - (iTotal mod 11);
    //Pega o dígito verificador(Fim)

    //2º verificação do CGC.
    cpfValido := not (iDigVerif <> aiDigito[13]);
    //Se for identidficado um erro gerar exceção.
    if not cpfValido then
     raise Exception.Create(Format(msgCGC_CPFInvalido, ['CGC']));


    //Zera o acumulador dos dígitos do CGC.
    iTotal         := 0;
    //Usado para auxiliar a validação do CGC.
    iMultiplicador := 6;
    //Acumula os dígitos do CGC.
    for iIndice := 1 to 13 do
    begin
      iTotal := iTotal + aiDigito[iIndice] * iMultiplicador;
      if (iMultiplicador = 2) then iMultiplicador := 9 else dec(iMultiplicador);
    end;

    //Pega o dígito verificador(Início)
    if (iTotal < 11) then iTotal := iTotal * 10;
    if (((iTotal mod 11) = 1) or ((iTotal mod 11) = 0)) then iDigVerif := 0
    else iDigVerif := 11 - (iTotal mod 11);
    //Pega o dígito verificador(Fim)


    //3º verificação do CGC.
    cpfValido := not (iDigVerif <> aiDigito[14]);
    //Se for identidficado um erro gerar exceção.
    if not cpfValido then
     raise Exception.Create(Format(msgCGC_CPFInvalido, ['CGC']));
  except
    raise;
  end;
end;

class function TUtil.mensagemErro(e: Exception): string;
begin
  if e.ClassNameIs('ESQLDatabaseError') then
  begin
     // Chave primária
    if ESQLDatabaseError(e).ErrorCode = 1062 then
      result := 'Registro já cadastrado'
  end
  else result := e.Message;
end;

end.

