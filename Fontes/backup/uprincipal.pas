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
    menuItemCadastros: TMenuItem;
    menuItemSair: TMenuItem;
    MenuItem3: TMenuItem;
    SQLQuery1: TSQLQuery;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure menuItemSairClick(Sender: TObject);

    procedure onExcept(sender: TObject; e: Exception);
  private

  public

  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
    uCadastroAlunos;

{$R *.lfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
   if Application.MessageBox('Deseja sair?', 'Sair', MB_ICONQUESTION + MB_YESNO) = idNo then
      CloseAction := caNone;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  application.onException := @onExcept;
end;

procedure TfrmPrincipal.onExcept(sender: TObject; e: Exception);
begin
  Application.MessageBox(PChar(e.Message), 'ERRO', MB_ICONERROR);
end;

procedure TfrmPrincipal.MenuItem3Click(Sender: TObject);
begin
  with TfrmCadastroAlunos.Create(Application) do
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

