unit uCadastroUsuario;

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
    DBRadioGroup1: TDBRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    sqlQueryPadraoativo: TStringField;
    sqlQueryPadraofk_perfil_usuario_id: TLargeintField;
    sqlQueryPadraoid: TLargeintField;
    sqlQueryPadraologin: TStringField;
    sqlQueryPadraonome: TStringField;
    sqlQueryPadraosenha: TStringField;
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
  uUsuarioService, base64;

{$R *.lfm}

procedure TfrmCadastroUsuario.sqlQueryPadraoAfterEdit(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('senha').AsString:=DecodeStringBase64(DataSet.FieldByName('senha').AsString);
end;

procedure TfrmCadastroUsuario.sqlQueryPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('ativo').AsString:='S';
  DataSet.FieldByName('fk_perfil_usuario_id').AsInteger:=2;
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

procedure TfrmCadastroUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  captionForm := 'Cadastro de usuário';
end;

procedure TfrmCadastroUsuario.FormShow(Sender: TObject);
begin
  inherited;
  sqlQueryPadrao.Open;
end;

end.

