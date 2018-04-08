program SGESC;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, sdflaz, uDATMOD, uCadastroPadrao, uCadastroAlunos, uPrincipal,
  uClassUtil, uCadastroResponsavelFinanceiro, uFinanceiroService, uAlunoService,
  uResponsavelService, uFormBase, uConsultaAluno, uRegistrarFrequencia, uAluno,
  uFrequenciaService
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TDataModuleApp, DataModuleApp);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.

