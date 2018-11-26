unit uFormBase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, db, maskutils, uUsuario;

type

  { TfrmBase }

  TfrmBase = class(TForm)
    btnSair: TBitBtn;
    pnlFrmBaseSair: TPanel;
    pnlBottom: TPanel;
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mostrarHoraFormatada(Sender: TField; var aText: string;
      {%H-}DisplayText: Boolean);
    procedure mostrarCEPFormatado(Sender: TField; var aText: string;
      {%H-}DisplayText: Boolean);
    procedure mostrarCPFFormatado(Sender: TField; var aText: string;
      {%H-}DisplayText: Boolean);
    procedure mostrarTelefoneFormatado(Sender: TField; var aText: string;
      {%H-}DisplayText: Boolean);
    procedure mostrarCelularFormatado(Sender: TField; var aText: string;
      {%H-}DisplayText: Boolean);

  private
    FperfilAcessoPermitido: TPerfil;
  public
    property perfilAcessoPermitido: TPerfil read FperfilAcessoPermitido write FperfilAcessoPermitido;

  public

  end;

var
  frmBase: TfrmBase;

implementation

{$R *.lfm}

{ TfrmBase }

procedure TfrmBase.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBase.FormCreate(Sender: TObject);
begin
  FperfilAcessoPermitido := gpUsuario;
end;

procedure TfrmBase.FormShow(Sender: TObject);
begin
  if FperfilAcessoPermitido in usuario.perfil then
  begin
    Close;
    raise Exception.Create('Usuário não tem permissão a esta funcionalidade!');
  end;
end;

procedure TfrmBase.mostrarHoraFormatada(Sender: TField; var aText: string;
  DisplayText: Boolean);
begin
  aText := FormatMaskText('00\:00;0; ', Sender.AsString);
end;

procedure TfrmBase.mostrarCEPFormatado(Sender: TField; var aText: string;
  DisplayText: Boolean);
begin
  aText := FormatMaskText('00000\-000;0; ', Sender.AsString);
end;

procedure TfrmBase.mostrarCPFFormatado(Sender: TField; var aText: string;
  DisplayText: Boolean);
begin
  aText := FormatMaskText('000\.000.\000\-00;0; ', Sender.AsString);
end;

procedure TfrmBase.mostrarTelefoneFormatado(Sender: TField; var aText: string;
  DisplayText: Boolean);
begin
  aText := FormatMaskText('\(00\) 0000\-0000;0; ', Sender.AsString);
end;

procedure TfrmBase.mostrarCelularFormatado(Sender: TField; var aText: string;
  DisplayText: Boolean);
begin
  aText := FormatMaskText('\(00\) 00000\-0000;0; ', Sender.AsString);
end;

end.

