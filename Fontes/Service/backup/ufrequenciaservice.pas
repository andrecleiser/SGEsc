unit uFrequenciaService;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, LCLType, sqldb;

type
  TFrequenciaService = class

  private

  public
    class procedure registrarFrequencia(idAluno: integer; idTurma: integer);
  end;

implementation

uses
  uDATMOD, uClassUtil;


class procedure TFrequenciaService.registrarFrequencia(idAluno: integer; idTurma: integer);
begin
  try
    DataModuleApp.MySQL57Connection.ExecuteDirect('insert into frequencia values (' + idAluno.ToString + ', date(now()), ' + QuotedStr(FormatDateTime('hhnn', Time)) + ', ' + idTurma.ToString + ')');
    DataModuleApp.sqlTransactionGeral.CommitRetaining;
    Application.MessageBox('Frequência registrada com sucesso.', 'SUCESSO', MB_ICONINFORMATION);
  except
    on e: Exception do
      Application.MessageBox('Frequênia já registrada ao aluno/turma!', 'REGISTRO DE FREQUÊNCIA', MB_ICONERROR);
  end;
end;

end.

