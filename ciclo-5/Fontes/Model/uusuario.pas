{%RunFlags MESSAGES+}
unit uUsuario;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db;

type

  TUsuario = class
  private
    fid    : integer;
    flogin : string;
    fnome  : string;
    fperfil: integer;
    fsenha : string;
    fativo : string;

  public

    property id    : integer read fid     write fid    ;
    property login : string  read flogin  write flogin ;
    property nome  : string  read fnome   write fnome  ;
    property perfil: integer read fperfil write fperfil;
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
  fperfil := pperfil;
  fsenha  := psenha;
  fativo  := pativo;
end;

procedure TUsuario.setUsuario(dataSetUsuario: TDataSet);
begin
  fid     := dataSetUsuario.FieldByName('id').AsInteger;
  flogin  := dataSetUsuario.FieldByName('login').AsString;
  fnome   := dataSetUsuario.FieldByName('nome').AsString;
  fperfil := dataSetUsuario.FieldByName('fk_perfil_usuario_id').AsInteger;
  fsenha  := dataSetUsuario.FieldByName('senha').AsString;
  fativo  := dataSetUsuario.FieldByName('ativo').AsString;
end;

end.

