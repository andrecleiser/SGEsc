{%RunFlags MESSAGES+}
unit uUsuario;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db;


type
  TPerfil = (gpGerente = 1, gpUsuario = 2, gpAdministrador = 3);
  TGrupoPerfil = set of TPerfil;

  TUsuario = class
  private
    fid    : integer;
    flogin : string;
    fnome  : string;
    fperfil: TGrupoPerfil;
    fsenha : string;
    fativo : string;

    function obterPerfil(pperfil: integer): TGrupoPerfil;
  public

    property id    : integer read fid     write fid    ;
    property login : string  read flogin  write flogin ;
    property nome  : string  read fnome   write fnome  ;
    property perfil: TGrupoPerfil read fperfil write fperfil;
    property senha : string  read fsenha  write fsenha ;
    property ativo : string  read fativo  write fativo ;

    constructor create(pid    : integer;
                       plogin : string;
                       pnome  : string;
                       pperfil: integer;
                       psenha : string;
                       pativo : string); overload;

    constructor create(dataSetUsuario: TDataSet); overload;

    procedure setUsuario(pid    : integer;
                         plogin : string;
                         pnome  : string;
                         pperfil: integer;
                         psenha : string;
                         pativo : string); overload;

    procedure setUsuario(dataSetUsuario: TDataSet); overload;


  end;

var
  usuario: TUsuario;

const
  PERFIL_GERENTE = 1;
  PERFIL_USUARIO = 2;
  PERFIL_ADMINISTRADOR = 3;


implementation

constructor TUsuario.create(pid    : integer;
                            plogin : string;
                            pnome  : string;
                            pperfil: integer;
                            psenha : string;
                            pativo : string);
begin
  setUsuario(pid, plogin, pnome, pperfil, psenha, pativo);
end;


constructor TUsuario.create(dataSetUsuario: TDataSet);
begin
  setUsuario(dataSetUsuario);
end;

procedure TUsuario.setUsuario(pid    : integer;
                              plogin : string;
                              pnome  : string;
                              pperfil: integer;
                              psenha : string;
                              pativo : string);
begin
  fid     := pid;
  flogin  := plogin;
  fnome   := pnome;
  fperfil := obterPerfil(pperfil);
  fsenha  := psenha;
  fativo  := pativo;
end;

procedure TUsuario.setUsuario(dataSetUsuario: TDataSet);
begin
  fid     := dataSetUsuario.FieldByName('id').AsInteger;
  flogin  := dataSetUsuario.FieldByName('login').AsString;
  fnome   := dataSetUsuario.FieldByName('nome').AsString;
  fperfil := obterPerfil(dataSetUsuario.FieldByName('fk_perfil_usuario_id').AsInteger);
  fsenha  := dataSetUsuario.FieldByName('senha').AsString;
  fativo  := dataSetUsuario.FieldByName('ativo').AsString;
end;

function TUsuario.obterPerfil(pperfil: integer): TGrupoPerfil;
begin
  case pperfil of
    PERFIL_ADMINISTRADOR: result := [gpAdministrador, gpGerente, gpUsuario];
    PERFIL_GERENTE: result := [gpGerente, gpUsuario];
    PERFIL_USUARIO: result := [gpUsuario];
  end;
end;

end.

