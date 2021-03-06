//2 15 R$256,84 R366,71 CRISTIANE
{
insert into usuario (login, nome, fk_perfil_usuario_id, senha, ativo)
values (:login, :nome, :fk_perfil_usuario_id, :senha, :ativo)

delete from usuario where id = :OLD_id

update usuario
set    login = :login,
       nome = :nome,
       fk_perfil_usuario_id = :fk_perfil_usuario_id,
       senha = :senha,
       ativo = :ativo
where  id = :OLD_id
}
unit uCadastroUsuario;

{$mode objfpc}{$H+}
{$WARN 5024 on : Parameter "$1" not used}
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
    sqlQueryPadraoativo: TStringField;
    sqlQueryPadraofk_perfil_usuario_id: TLargeintField;
    sqlQueryPadraoid: TLargeintField;
    sqlQueryPadraologin: TStringField;
    sqlQueryPadraonome: TStringField;
    sqlQueryPadraosenha: TStringField;
    procedure FormClose(Sender: TObject; var {%H-}CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sqlQueryPadraoAfterEdit(DataSet: TDataSet);
    procedure sqlQueryPadraoAfterInsert(DataSet: TDataSet);
    procedure sqlQueryPadraoAfterPost(DataSet: TDataSet);
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

procedure TfrmCadastroUsuario.sqlQueryPadraoAfterEdit(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('senha').AsString:=DecodeStringBase64(DataSet.FieldByName('senha').AsString);
end;

procedure TfrmCadastroUsuario.sqlQueryPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('ativo').AsString:='S';
end;

procedure TfrmCadastroUsuario.sqlQueryPadraoAfterPost(DataSet: TDataSet);
begin
  inherited;
  //Refresh para obter o "id"
  DataSet.Refresh;
end;

procedure TfrmCadastroUsuario.sqlQueryPadraoBeforePost(DataSet: TDataSet);
begin
  TUsuarioService.validarDados(DataSet);
  DataSet.FieldByName('senha').AsString:=EncodeStringBase64(DataSet.FieldByName('senha').AsString);
  inherited;
end;

procedure TfrmCadastroUsuario.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DataModuleApp.qryLookUpPerfilUsuario.Close;
end;

procedure TfrmCadastroUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  captionForm := 'Cadastro de usuário';
end;

end.

