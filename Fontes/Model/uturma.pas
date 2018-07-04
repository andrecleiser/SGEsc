unit uTurma;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db;

type

  TTurma = class
  private
    fid: integer;
    fdescricao: string;
    fcontrolar_horario: string;
    ffk_perfil_professor_id: TDate;
    fhora_inicio: string;
    fhora_fim: string;
    fvalor_sugerido: Double;
    flimite_alunos: integer;
  public
    property id                    : integer read fid;
    property descricao             : string read  fdescricao;
    property controlar_horario     : string read  fcontrolar_horario;
    property fk_perfil_professor_id: TDate read   ffk_perfil_professor_id;
    property hora_inicio           : string read  fhora_inicio;
    property hora_fim              : string read  fhora_fim;
    property valor_sugerido        : Double read  fvalor_sugerido;
    property limite_alunos         : integer read flimite_alunos;


    constructor create(pid                    : integer;
                       pdescricao             : string;
                       pcontrolar_horario     : string;
                       pfk_perfil_professor_id: TDate;
                       phora_inicio           : string;
                       phora_fim              : string;
                       pvalor_sugerido        : Double;
                       plimite_alunos         : integer); overload;

    constructor create(dataSeTTurma: TDataSet);  overload;

  end;

implementation

constructor TTurma.create(pid                    : integer;
                          pdescricao             : string;
                          pcontrolar_horario     : string;
                          pfk_perfil_professor_id: TDate;
                          phora_inicio           : string;
                          phora_fim              : string;
                          pvalor_sugerido        : Double;
                          plimite_alunos         : integer);
begin
  fid                     := pid;
  fdescricao              := pdescricao;
  fcontrolar_horario      := pcontrolar_horario;
  ffk_perfil_professor_id := pfk_perfil_professor_id;
  fhora_inicio            := phora_inicio;
  fhora_fim               := phora_fim;
  fvalor_sugerido         := pvalor_sugerido;
  flimite_alunos          := plimite_alunos;
end;


constructor TTurma.create(dataSeTTurma: TDataSet);
begin
  fid                     := dataSeTTurma.FieldByName('id').AsInteger;
  fdescricao              := dataSeTTurma.FieldByName('descricao             ').AsString;
  fcontrolar_horario      := dataSeTTurma.FieldByName('controlar_horario     ').AsString;
  ffk_perfil_professor_id := dataSeTTurma.FieldByName('fk_perfil_professor_id').AsInteger;
  fhora_inicio            := dataSeTTurma.FieldByName('hora_inicio           ').AsString;
  fhora_fim               := dataSeTTurma.FieldByName('hora_fim              ').AsString;
  fvalor_sugerido         := dataSeTTurma.FieldByName('valor_sugerido        ').AsFloat;
  flimite_alunos          := dataSeTTurma.FieldByName('limite_alunos         ').AsInteger;
end;

end.
