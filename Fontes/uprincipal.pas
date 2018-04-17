unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, FileUtil, Forms, Controls, Graphics, Dialogs,
  Menus, LCLType, DBGrids;

type

  { TfrmPrincipal }

  TfrmPrincipal = class(TForm)
    DataSource1: TDataSource;
    mainMenu: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItemRegistrarFrequencia: TMenuItem;
    menuItemCadastros: TMenuItem;
    menuItemSair: TMenuItem;
    MenuItem3: TMenuItem;
    SQLQuery1: TSQLQuery;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
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
    uCadastroAlunos, uConsultaAluno, uRegistrarFrequencia, uCadastroUsuario;

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

procedure TfrmPrincipal.MenuItem1Click(Sender: TObject);
begin
  TfrmConsultaAluno.abrirConsultaAluno(ccEditar);
{  with TfrmConsultaAluno.Create(Application) do
  try
    ShowModal;
  finally
    Free;
  end;}
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

