program SGESC;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, sdflaz, datetimectrls, lazcontrols, uDATMOD, uCadastroPadrao,
  uPrincipal, uClassUtil, uFinanceiroService, uAlunoService, uFormBase,
  uconsulta_aluno, uRegistrarFrequencia, uAluno, uFrequenciaService, uLogin,
  uUsuarioService, uUsuario, uConstantesSistema, uResgistroPagamento,
  uCadastrarTurma, uTurma_Aluno, uTurmaService, uTurma, uselecionarturmaaluno,
  uFichaFinanceira, uvisualizarfrequencia;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TDataModuleApp, DataModuleApp);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
