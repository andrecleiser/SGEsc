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
    class function alunoFrequentouDataInformada(idAluno: integer; data: TDate): boolean;
    class procedure registrarFrequencia(idAluno: integer);
  end;

implementation

uses
  uDATMOD, uClassUtil;

class function TFrequenciaService.obterAluno(idAluno: integer): TAluno;
begin
  result := TAlunoService.obterAluno(idAluno);

  if not Assigned(result) then
    raise Exception.Create('Aluno não encontrado');

  if TFrequenciaService.alunoFrequentouDataInformada(idAluno, Date) then
    raise Exception.Create('A frequência do aluno registrada hoje.');
end;

class function TFrequenciaService.alunoFrequentouDataInformada(idAluno: integer; data: TDate): boolean;
begin
  { TODO 1 : Implementar consulta à frequência do aluno }
  result := false;
end;

class procedure TFrequenciaService.registrarFrequencia(idAluno: integer);
begin
  try
    DataModuleApp.MySQL57Connection.ExecuteDirect('insert into frequencia values (' + idAluno.ToString + ', date(now()))');
    DataModuleApp.sqlTransactionGeral.CommitRetaining;
    Application.MessageBox('Frequência registrada com sucesso.', 'SUCESSO', MB_ICONINFORMATION);
  except
    on e: Exception do
      Application.MessageBox(PChar('Falha ao tentar registrar a frequência. ' + #13#10 + 'Erro: ' + TUtil.mensagemErro(e) + '.'), 'ERRO', MB_ICONERROR);
  end;
end;

end.

