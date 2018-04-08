unit uAluno;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db;

type

  TAluno = class
  private
    fid: integer;
    fnome: string;
    fdata_nascimento: TDate;
    fdata_cadastramento: TDate;
    fdata_inativacao: TDate;
    ffk_motivo_matricula_id: integer;
    ffk_doenca_pre_existente_id: integer;
  public
    property id: integer                         read fid;
    property nome: string                        read fnome;
    property data_nascimento: TDate              read fdata_nascimento;
    property data_cadastramento: TDate           read fdata_cadastramento;
    property data_inativacao: TDate              read fdata_inativacao;
    property fk_motivo_matricula_id: integer     read ffk_motivo_matricula_id;
    property fk_doenca_pre_existente_id: integer read ffk_doenca_pre_existente_id;

    constructor create(pid: integer;
                       pnome: string;
                       pdata_nascimento: TDate;
                       pdata_cadastramento: TDate;
                       pdata_inativacao: TDate;
                       pfk_motivo_matricula_id: integer;
                       pfk_doenca_pre_existente_id: integer); overload;

    constructor create(dataSetAluno: TDataSet);  overload;

  end;

implementation

constructor TAluno.create(pid: integer;
                          pnome: string;
                          pdata_nascimento: TDate;
                          pdata_cadastramento: TDate;
                          pdata_inativacao: TDate;
                          pfk_motivo_matricula_id: integer;
                          pfk_doenca_pre_existente_id: integer);
begin
  fid := pid;
  fnome := pnome;
  fdata_nascimento := pdata_nascimento;
  fdata_cadastramento := pdata_cadastramento;
  fdata_inativacao := pdata_inativacao;
  ffk_motivo_matricula_id := pfk_motivo_matricula_id;
  ffk_doenca_pre_existente_id := pfk_doenca_pre_existente_id;
end;


constructor TAluno.create(dataSetAluno: TDataSet);
begin
  fid := dataSetAluno.FieldByName('id').AsInteger;
  fnome := dataSetAluno.FieldByName('nome').AsString;
  fdata_nascimento := dataSetAluno.FieldByName('data_nascimento').AsDateTime;
  fdata_cadastramento := dataSetAluno.FieldByName('data_cadastramento').AsDateTime;
  fdata_inativacao := dataSetAluno.FieldByName('data_inativacao').AsDateTime;
  ffk_motivo_matricula_id := dataSetAluno.FieldByName('fk_motivo_matricula_id').AsInteger;
  ffk_doenca_pre_existente_id := dataSetAluno.FieldByName('fk_doenca_pre_existente_id').AsInteger;
end;

end.

