unit uCadastroAlunos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, FileUtil, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, DbCtrls, Buttons, ComCtrls, StdCtrls, DBExtCtrls, DBGrids, MaskEdit,
  uCadastroPadrao, uAlunoService, BufDataset;

type

  { TfrmCadastroAlunos }

  TfrmCadastroAlunos = class(TfrmCadastroPadrao)
    btnDesativar: TBitBtn;
    DBComboBox1: TDBComboBox;
    DBDateEdit1: TDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    dbeNome: TDBEdit;
    dblDoenca_Pre_Existente: TDBLookupComboBox;
    dblMotivo_Matricula: TDBLookupComboBox;
    DBMemo1: TDBMemo;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    imageList: TImageList;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblObservacao: TLabel;
    Panel1: TPanel;
    sqlQueryPadraoadimplente: TStringField;
    sqlQueryPadraobairro: TStringField;
    sqlQueryPadraocelular: TStringField;
    sqlQueryPadraocelular_responsavel: TStringField;
    sqlQueryPadraocep: TStringField;
    sqlQueryPadraocidade: TStringField;
    sqlQueryPadraocomplemento: TStringField;
    sqlQueryPadraocpf_responsavel: TStringField;
    sqlQueryPadraodata_cadastramento: TDateField;
    sqlQueryPadraodata_inativacao: TDateField;
    sqlQueryPadraodata_nascimento: TDateField;
    sqlQueryPadraoemail_responsavel: TStringField;
    sqlQueryPadraoestado: TStringField;
    sqlQueryPadraofk_doenca_pre_existente_id: TLargeintField;
    sqlQueryPadraofk_motivo_matricula_id: TLargeintField;
    sqlQueryPadraoid: TLargeintField;
    sqlQueryPadraonome: TStringField;
    sqlQueryPadraonome_mae: TStringField;
    sqlQueryPadraonome_pai: TStringField;
    sqlQueryPadraonome_responsavel: TStringField;
    sqlQueryPadraoobservacao: TStringField;
    sqlQueryPadraorg_responsavel: TStringField;
    sqlQueryPadraorua: TStringField;
    sqlQueryPadraotelefone: TStringField;
    sqlQueryPadraotelefone_responsavel: TStringField;
    procedure DBEdit14Exit(Sender: TObject);
    procedure DBEdit15Exit(Sender: TObject);
    procedure DBMemo1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sqlQueryPadraoBeforePost(DataSet: TDataSet);
  private
    procedure setImageSituacaoAluno;

  public

  end;

var
  frmCadastroAlunos: TfrmCadastroAlunos;

implementation

uses
  uClassUtil;

{$R *.lfm}

{ TfrmCadastroAlunos }

procedure TfrmCadastroAlunos.FormCreate(Sender: TObject);
begin
  inherited;
  sqlQueryPadrao.Close;
  sqlQueryPadrao.Params.Clear;
  sqlQueryPadrao.Params.CreateParam(ftInteger, 'id', ptInput);

  captionForm := 'Cadastro de aluno';
end;

procedure TfrmCadastroAlunos.FormShow(Sender: TObject);
begin

  inherited;
  dblMotivo_Matricula.ListSource.DataSet.Open;
  dblDoenca_Pre_Existente.ListSource.DataSet.Open;

  campoFocoEdicao := dbeNome;

  imageList.GetBitmap(0, btnDesativar.Glyph);
end;

procedure TfrmCadastroAlunos.FormDestroy(Sender: TObject);
begin
  dblMotivo_Matricula.ListSource.DataSet.Close;
  dblDoenca_Pre_Existente.ListSource.DataSet.Close;
  inherited;
end;

procedure TfrmCadastroAlunos.sqlQueryPadraoBeforePost(DataSet: TDataSet);
begin
  TAlunoService.validarDados(DataSet);

  inherited;

  if DataSet.State = dsInsert then
    DataSet.FieldByName('data_cadastramento').AsDateTime:=Date;
end;

procedure TfrmCadastroAlunos.DBMemo1Change(Sender: TObject);
begin
  lblObservacao.Caption := 'Observação - ' + TDBMemo(Sender).Lines.Text.Length.ToString + ' caracteres digitados de 200.';
end;

procedure TfrmCadastroAlunos.DBEdit14Exit(Sender: TObject);
begin
  if not sqlQueryPadrao.FieldByName('email_responsavel').IsNull then
    TUtil.validar_Email(sqlQueryPadrao.FieldByName('email_responsavel').AsString);
end;

procedure TfrmCadastroAlunos.DBEdit15Exit(Sender: TObject);
begin
  if not sqlQueryPadrao.FieldByName('cpf_responsavel').IsNull then
    TUtil.CheckCPF(sqlQueryPadrao.FieldByName('cpf_responsavel').AsString);
end;

procedure TfrmCadastroAlunos.setImageSituacaoAluno;
begin
  if sqlQueryPadrao.FieldByName('data_inativacao').IsNull then
  begin
    imageList.GetBitmap(0, btnDesativar.Glyph);
    btnDesativar.Caption := 'Desativar aluno';
  end
  else
  begin
    imageList.GetBitmap(1, btnDesativar.Glyph);
    btnDesativar.Caption := 'Ativar aluno';
  end
end;

end.
