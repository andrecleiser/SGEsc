unit uFrequenciaService;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uAluno, uAlunoService, Forms, LCLType, sqldb;

type
  TFrequenciaService = class

  private

  public
    class function obterAluno(idAluno: integer; pSituacaoAluno: TSetSituacaoAluno = [saTodos]): TAluno; overload;
    class procedure registrarFrequencia(idAluno: integer);
  end;

implementation

uses
  uDATMOD, uClassUtil;

class function TFrequenciaService.obterAluno(idAluno: integer; pSituacaoAluno: TSetSituacaoAluno = [saTodos]): TAluno; overload;
begin
  result := TAlunoService.obterAluno(idAluno, pSituacaoAluno);
end;

class procedure TFrequenciaService.registrarFrequencia(idAluno: integer);
begin
  try
    DataModuleApp.MySQL57Connection.ExecuteDirect('insert into frequencia values (' + idAluno.ToString + ', date(now()), ' + QuotedStr(FormatDateTime('hhnn', Time)) + ')');
    DataModuleApp.sqlTransactionGeral.CommitRetaining;
    Application.MessageBox('Frequência registrada com sucesso.', 'SUCESSO', MB_ICONINFORMATION);
  except
    on e: Exception do
      Application.MessageBox(PChar(TUtil.mensagemErro(e) + '.'), 'ERRO', MB_ICONERROR);
  end;
end;

end.

