unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, FileUtil, Forms, Controls, Graphics, Dialogs,
  Menus, LCLType, DBGrids, ComCtrls;

type

  { TfrmPrincipal }

  TfrmPrincipal = class(TForm)
    mainMenu: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItemRegistrarFrequencia: TMenuItem;
    menuItemCadastros: TMenuItem;
    menuItemSair: TMenuItem;
    MenuItem3: TMenuItem;
    StatusBar: TStatusBar;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure MenuItemRegistrarFrequenciaClick(Sender: TObject);
    procedure menuItemSairClick(Sender: TObject);

//    procedure OnExcept({%H-}sender: TObject; e: Exception);
  private

  public

  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
    uCadastroAlunos, uRegistrarFrequencia, uCadastroUsuario, uLogin,
    uconsulta_turma, uconsulta_aluno, {uCadastrarTurma, }uTurma_Aluno,
    uResgistroPagamento;

{$R *.lfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
   if Application.MessageBox('Deseja sair?', 'Sair', MB_ICONQUESTION + MB_YESNO) = idNo then
     CloseAction := caNone
   else
     Application.Terminate;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
//   Application.OnException := @OnExcept;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  StatusBar.Panels[0].Text:=' Usuário logado: ' + usuario.nome;
end;

procedure TfrmPrincipal.MenuItem10Click(Sender: TObject);
begin
  TfrmConsultaTurma.abrirConsultaTurma();
end;

procedure TfrmPrincipal.MenuItem12Click(Sender: TObject);
begin
  with TfrmRegistrarPagamento.Create(Application) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.MenuItem1Click(Sender: TObject);
begin
  TfrmConsultaAluno.abrirConsultaAluno([ccEditar]);
end;

{procedure TfrmPrincipal.onExcept(sender: TObject; e: Exception);
begin
  Application.MessageBox(PChar(e.Message), 'ERRO', MB_ICONERROR);
end;}

procedure TfrmPrincipal.MenuItem3Click(Sender: TObject);
begin
  with TfrmCadastroAlunos.Create(Application) do
  try
    sqlQueryPadrao.ParamByName('id').AsInteger:=0;
    sqlQueryPadrao.Open;
    sqlQueryPadrao.Insert;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.MenuItem6Click(Sender: TObject);
begin
  with TfrmCadastroUsuario.Create(Application) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.MenuItem8Click(Sender: TObject);
begin
  Application.MessageBox('Funcionalidade a ser implementada.', 'INFORMAÇÃO');
  {
  with TfrmCadastroTurma.Create(Application) do
  try
    ShowModal;
  finally
    Free;
  end;}
end;

procedure TfrmPrincipal.MenuItem9Click(Sender: TObject);
begin
  with TfrmGerenciarTurma.Create(Application) do
  try
    sqlQueryPadrao.ServerFilter := 'fk_turma_id = -1';
    sqlQueryPadrao.Open;
    ShowModal;
  finally
    sqlQueryPadrao.ServerFilter := '';
    Free;
  end;
end;

procedure TfrmPrincipal.MenuItemRegistrarFrequenciaClick(Sender: TObject);
begin
  with TfrmRegistrarFrequencia.Create(Application) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.menuItemSairClick(Sender: TObject);
begin
  Close;
end;

end.

