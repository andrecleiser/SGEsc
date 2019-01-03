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
    btnTurma: TBitBtn;
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
    DBEdit19: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    dbeNome: TDBEdit;
    dbeNome1: TDBEdit;
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
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
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
    sqlQueryPadraodia_vencimento: TLargeintField;
    sqlQueryPadraoemail_responsavel: TStringField;
    sqlQueryPadraoestado: TStringField;
    sqlQueryPadraofk_doenca_pre_existente_id: TLargeintField;
    sqlQueryPadraofk_motivo_matricula_id: TLargeintField;
    sqlQueryPadraohora_turma: TStringField;
    sqlQueryPadraoid: TLargeintField;
    sqlQueryPadraomodalidade: TStringField;
    sqlQueryPadraonome: TStringField;
    sqlQueryPadraonome_mae: TStringField;
    sqlQueryPadraonome_pai: TStringField;
    sqlQueryPadraonome_responsavel: TStringField;
    sqlQueryPadraoobservacao: TStringField;
    sqlQueryPadraorg_responsavel: TStringField;
    sqlQueryPadraorua: TStringField;
    sqlQueryPadraotelefone: TStringField;
    sqlQueryPadraotelefone_responsavel: TStringField;
    procedure btnDesativarClick(Sender: TObject);
    procedure btnTurmaClick(Sender: TObject);
    procedure DBEdit14Exit(Sender: TObject);
    procedure DBEdit15Exit(Sender: TObject);
    procedure DBMemo1Change(Sender: TObject);
    procedure dsPadraoStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sqlQueryPadraoAfterInsert(DataSet: TDataSet);
    procedure sqlQueryPadraoAfterScroll({%H-}DataSet: TDataSet);
    procedure sqlQueryPadraoBeforePost(DataSet: TDataSet);
  private
    procedure setImageSituacaoAluno;

  public

  end;

var
  frmCadastroAlunos: TfrmCadastroAlunos;

implementation

uses
  uClassUtil, uTurma_Aluno;

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

procedure TfrmCadastroAlunos.sqlQueryPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  sqlQueryPadrao.FieldByName('estado').AsString := 'PE';
end;

procedure TfrmCadastroAlunos.sqlQueryPadraoAfterScroll(DataSet: TDataSet);
begin
  setImageSituacaoAluno;
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

procedure TfrmCadastroAlunos.dsPadraoStateChange(Sender: TObject);
begin
  inherited;
  btnDesativar.Enabled:=not (sqlQueryPadrao.State in [dsEdit, dsInsert]);
  btnTurma.Enabled:=not (sqlQueryPadrao.State in [dsEdit, dsInsert]);
end;

procedure TfrmCadastroAlunos.DBEdit14Exit(Sender: TObject);
begin
  if not sqlQueryPadrao.FieldByName('email_responsavel').IsNull then
    TUtil.validar_Email(sqlQueryPadrao.FieldByName('email_responsavel').AsString);
end;

procedure TfrmCadastroAlunos.btnDesativarClick(Sender: TObject);
begin
  if sqlQueryPadrao.FieldByName('id').IsNull then
    raise Exception.Create('Para desativar um aluno recém cadastrado, feche o cadastro e selecione o novo aluno através da consulta de aluno.');

  if btnDesativar.Caption = 'Desativar aluno' then
    TAlunoService.desativarAluno(sqlQueryPadrao.FieldByName('id').AsInteger)
  else
    TAlunoService.ativarAluno(sqlQueryPadrao.FieldByName('id').AsInteger);

  sqlQueryPadrao.Refresh;

  setImageSituacaoAluno;
end;

procedure TfrmCadastroAlunos.btnTurmaClick(Sender: TObject);
var
  id: integer;
begin
  with TfrmGerenciarTurma.Create(Application) do
  try
    chamadoPor := cpCadastroAluno;

    // Na inclusão, deverá ser obtido o último id inserido
    if sqlQueryPadraoId.IsNull then
      id := TAlunoService.ultimoId()
    else
      id := sqlQueryPadraoId.AsInteger;

    sqlQueryPadrao.ServerFilter := 'fk_aluno_id = ' + id.ToString;
    sqlQueryPadrao.Open;
    idAluno := id;
    ShowModal;
  finally
    sqlQueryPadrao.Close;
    sqlQueryPadrao.ServerFilter := '';
    Free;
  end;
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
