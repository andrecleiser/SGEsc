unit uFrequenciaService;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uAluno, uAlunoService, Forms, LCLType, sqldb;

type
  TFrequenciaService = class

  private

  public
    class function obterAluno(idAluno: integer): TAluno;
    class procedure registrarFrequencia(idAluno: integer);
  end;

implementation

uses
  uDATMOD, uClassUtil;

class function TFrequenciaService.obterAluno(idAluno: integer): TAluno;
begin
  result := TAlunoService.obterAlunoAtivo(idAluno);

  if not Assigned(result) then
    raise Exception.Create('Aluno não cadastrado.');
end;

class procedure TFrequenciaService.registrarFrequencia(idAluno: integer);
begin
  try
    DataModuleApp.MySQL57Connection.ExecuteDirect('insert into frequencia values (' + idAluno.ToString + ', date(now()))');
    DataModuleApp.sqlTransactionGeral.CommitRetaining;
    Application.MessageBox('Frequência registrada com sucesso.', 'SUCESSO', MB_ICONINFORMATION);
  except
    on e: Exception do
      Application.MessageBox(PChar(TUtil.mensagemErro(e) + '.'), 'ERRO', MB_ICONERROR);
  end;
end;

end.

