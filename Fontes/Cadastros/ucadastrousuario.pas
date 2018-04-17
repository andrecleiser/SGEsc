unit uCadastroUsuario;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, DbCtrls, StdCtrls, uCadastroPadrao, db, BufDataset;

type

  { TfrmCadastroUsuario }

  TfrmCadastroUsuario = class(TfrmCadastroPadrao)
    DBCheckBox1: TDBCheckBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    dbeSenha: TDBEdit;
    DBEdit4: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sqlQueryPadraoBeforePost(DataSet: TDataSet);
  private

  public

  end;

var
  frmCadastroUsuario: TfrmCadastroUsuario;

implementation

uses
  uDATMOD, uUsuarioService, base64;

{$R *.lfm}

{ TfrmCadastroUsuario }

procedure TfrmCadastroUsuario.FormShow(Sender: TObject);
begin
  sqlQueryPadrao.Open;
  DataModuleApp.qryLookUpPerfilUsuario.Open;
end;

procedure TfrmCadastroUsuario.sqlQueryPadraoBeforePost(DataSet: TDataSet);
begin
  TUsuarioService.validarDados(DataSet);
  sqlQueryPadrao.FieldByName('senha').AsString:=EncodeStringBase64(sqlQueryPadrao.FieldByName('senha').AsString);
  inherited;
end;

procedure TfrmCadastroUsuario.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DataModuleApp.qryLookUpPerfilUsuario.Close;
end;

end.

