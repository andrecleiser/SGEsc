program SGESC;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, sdflaz, uDATMOD, uCadastroPadrao, uCadastroAlunos, uPrincipal,
  uClassUtil, uFinanceiroService, uAlunoService,
  uFormBase, uConsultaAluno, uRegistrarFrequencia, uAluno,
  uFrequenciaService, uCadastroUsuario, uLogin, uUsuarioService, uUsuario
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TDataModuleApp, DataModuleApp);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.

