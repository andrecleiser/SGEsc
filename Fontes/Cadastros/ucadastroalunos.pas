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
    btnNovoResponsavel: TBitBtn;
    btnEditarResponsavel: TBitBtn;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    dsResponsavel: TDataSource;
    DBComboBox1: TDBComboBox;
    DBDateEdit1: TDBDateEdit;
    dbeNome: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit9: TDBEdit;
    DBGrid1: TDBGrid;
    dblMotivo_Matricula: TDBLookupComboBox;
    dblDoenca_Pre_Existente: TDBLookupComboBox;
    DBMemo1: TDBMemo;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    imageList: TImageList;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    lblObservacao: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    PageControl: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    pnlErroResponsavel: TPanel;
    Panel5: TPanel;
    sqlQueryPadraoadimplente: TStringField;
    sqlQueryPadraobairro: TStringField;
    sqlQueryPadraocelular: TStringField;
    sqlQueryPadraocep: TStringField;
    sqlQueryPadraocidade: TStringField;
    sqlQueryPadraocomplemento: TStringField;
    sqlQueryPadraodata_cadastramento: TDateField;
    sqlQueryPadraodata_inativacao: TDateField;
    sqlQueryPadraodata_nascimento: TDateField;
    sqlQueryPadraoestado: TStringField;
    sqlQueryPadraofk_doenca_pre_existente_id: TLargeintField;
    sqlQueryPadraofk_motivo_matricula_id: TLargeintField;
    sqlQueryPadraoid: TLargeintField;
    sqlQueryPadraonome: TStringField;
    sqlQueryPadraonome_mae: TStringField;
    sqlQueryPadraonome_pai: TStringField;
    sqlQueryPadraoobservacao: TStringField;
    sqlQueryPadraorua: TStringField;
    sqlQueryPadraotelefone: TStringField;
    sqlQueryResponsavel: TSQLQuery;
    TabSheetGeral: TTabSheet;
    TabSheetResponsavel: TTabSheet;
    procedure btnDesativarClick(Sender: TObject);
    procedure btnNovoResponsavelClick(Sender: TObject);
    procedure DBMemo1Change(Sender: TObject);
    procedure dsPadraoStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure sqlQueryPadraoAfterInsert(DataSet: TDataSet);
    procedure sqlQueryPadraoAfterPost({%H-}DataSet: TDataSet);
    procedure sqlQueryPadraoBeforePost(DataSet: TDataSet);
    procedure sqlQueryResponsavelBeforeOpen({%H-}DataSet: TDataSet);
  private
    procedure setImageSituacaoAluno;

  public

  end;

var
  frmCadastroAlunos: TfrmCadastroAlunos;

implementation

uses
  uCadastroResponsavelFinanceiro, uDATMOD;

{$R *.lfm}

{ TfrmCadastroAlunos }

procedure TfrmCadastroAlunos.FormCreate(Sender: TObject);
begin
  inherited;
  sqlQueryPadrao.Close;
  sqlQueryPadrao.Params.Clear;
  sqlQueryPadrao.Params.CreateParam(ftInteger, 'id', ptInput);
//  sqlQueryPadrao.ServerFiltered:=true;

  captionForm := 'Cadastro de aluno';
  campoChavePrimaria:='id';
  Tabela:='aluno';
end;

procedure TfrmCadastroAlunos.FormShow(Sender: TObject);
begin

  inherited;
  dblMotivo_Matricula.ListSource.DataSet.Open;
  dblDoenca_Pre_Existente.ListSource.DataSet.Open;

  campoFocoEdicao := dbeNome;

  PageControl.ActivePage := TabSheetGeral;
{
update aluno
set nome = :nome,
    data_nascimento = :data_nascimento,
    rua = :rua,
    complemento = :complemento,
    bairro = :bairro,
    cidade = :cidade,
    estado = :estado,
    cep = :cep,
    telefone = :telefone,
    celular = :celular,
    nome_pai = :nome_pai,
    nome_mae =  :nome_mae,
    observacao = :observacao,
    fk_motivo_matricula_id = :fk_motivo_matricula_id,
    fk_doenca_pre_existente_id = :fk_doenca_pre_existente_id
where id = :old_id
}
  imageList.GetBitmap(0, btnDesativar.Glyph);
end;

procedure TfrmCadastroAlunos.FormDestroy(Sender: TObject);
begin
  dblMotivo_Matricula.ListSource.DataSet.Close;
  dblDoenca_Pre_Existente.ListSource.DataSet.Close;
  inherited;
end;

procedure TfrmCadastroAlunos.PageControlChange(Sender: TObject);
begin
  dbNavAlunos.Enabled := not (TPageControl(Sender).ActivePage = TabSheetResponsavel);
  if TPageControl(Sender).ActivePage = TabSheetResponsavel then
  begin
    sqlQueryResponsavel.Open;
    btnEditarResponsavel.Enabled := not sqlQueryResponsavel.IsEmpty;
  end
  else
  begin
    pnlErroResponsavel.Visible := sqlQueryResponsavel.IsEmpty;
    sqlQueryResponsavel.Close;
  end;
end;

procedure TfrmCadastroAlunos.sqlQueryPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  pnlErroResponsavel.Visible := true;
end;

procedure TfrmCadastroAlunos.sqlQueryPadraoAfterPost(DataSet: TDataSet);
begin
  dsPadrao.OnStateChange(dsPadrao);
end;

procedure TfrmCadastroAlunos.sqlQueryPadraoBeforePost(DataSet: TDataSet);
begin
  TAlunoService.validarDados(DataSet);

  inherited;

  if DataSet.State = dsInsert then
    DataSet.FieldByName('data_cadastramento').AsDateTime:=Date;
end;

procedure TfrmCadastroAlunos.sqlQueryResponsavelBeforeOpen(DataSet: TDataSet);
begin
  sqlQueryResponsavel.Params[0].AsInteger:=sqlQueryPadrao.FieldByName('id').AsInteger;
end;

procedure TfrmCadastroAlunos.dsPadraoStateChange(Sender: TObject);
begin
  inherited;
    // Será permitido informar um responsável se não estiver em edição ou existir aluno.
   TabSheetResponsavel.Enabled := (TDataSource(Sender).State = dsBrowse) and (not TDataSource(Sender).DataSet.IsEmpty);
end;

procedure TfrmCadastroAlunos.btnNovoResponsavelClick(Sender: TObject);
begin
  with TfrmCadastroResponsavelFinanceiro.Create(Application) do
  try
    sqlQueryPadrao.Params[0].AsInteger := sqlQueryResponsavel.FieldByName('id').AsInteger;
    sqlQueryPadrao.Open;
    pnlAluno.Caption := '  Aluno: ' + Self.sqlQueryPadrao.FieldByName('nome').AsString;
    id_aluno         := Self.sqlQueryPadrao.FieldByName('id').AsInteger;
    case TBitBtn(Sender).Tag of
      1: sqlQueryPadrao.Insert;
      2: sqlQueryPadrao.Edit;
    end;
    ShowModal;
  finally
    sqlQueryResponsavel.Close;
    PageControl.ActivePage := TabSheetGeral;
    Free;
  end;
end;

procedure TfrmCadastroAlunos.DBMemo1Change(Sender: TObject);
begin
  lblObservacao.Caption := 'Observação - ' + TDBMemo(Sender).Lines.Text.Length.ToString + ' caracteres digitados de 200.';
end;

procedure TfrmCadastroAlunos.btnDesativarClick(Sender: TObject);
begin
  {sqlQueryPadrao.ParamByName('adimplente').AsString := alunoService.financeiro.alunoAdimplente;
  sqlQueryPadrao.ParamByName('id').AsInteger:= sqlQueryPadrao.FieldByName('id').AsInteger;}
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
