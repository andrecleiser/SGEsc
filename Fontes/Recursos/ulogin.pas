unit uLogin;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
Buttons, StdCtrls, LCLType, uFormBase;

type

  { TfrmLogin }
  TfrmLogin = class(TfrmBase)
    btnSair1: TBitBtn;
    edtLogin: TEdit;
    edtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnSair1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OnExcept({%H-}sender: TObject; e: Exception);

  private

  public

  end;

var
  frmLogin: TfrmLogin;


implementation

uses
  uUsuario, uUsuarioService, uPrincipal;

{$R *.lfm}

{ TfrmLogin }

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  Application.OnException := @OnExcept;
  usuario := TUsuario.Create;
end;

procedure TfrmLogin.FormDestroy(Sender: TObject);
begin
  usuario.Free;
end;

procedure TfrmLogin.OnExcept(sender: TObject; e: Exception);
begin
  Application.MessageBox(PChar(e.Message), 'ERRO', MB_ICONERROR);
end;

procedure TfrmLogin.btnSair1Click(Sender: TObject);
begin
  usuario.login := edtLogin.Text;
  usuario.senha := edtSenha.Text;

  TUsuarioService.validarUsuario(usuario);

  Hide;

  Application.CreateForm(TfrmPrincipal, frmPrincipal);
end;


end.

