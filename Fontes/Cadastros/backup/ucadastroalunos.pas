unit uCadastroAlunos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, FileUtil, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, DbCtrls, Buttons, ComCtrls, StdCtrls, DBExtCtrls, DBGrids, MaskEdit,
  uCadastroPadrao;

type

  { TfrmCadastroAlunos }

  TfrmCadastroAlunos = class(TfrmCadastroPadrao)
    btnNovoResponsavel: TBitBtn;
    btnEditarResponsavel: TBitBtn;
    dsResponsavel: TDataSource;
    DBComboBox1: TDBComboBox;
    DBDateEdit1: TDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBGrid1: TDBGrid;
    dblMotivo_Matricula: TDBLookupComboBox;
    dblDoenca_Pre_Existente: TDBLookupComboBox;
    DBMemo1: TDBMemo;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
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
    Panel5: TPanel;
    sqlQueryResponsavel: TSQLQuery;
    sqlQueryPadraobairro: TStringField;
    sqlQueryPadraocelular: TStringField;
    sqlQueryPadraocep: TStringField;
    sqlQueryPadraocidade: TStringField;
    sqlQueryPadraodata_nascimento: TDateField;
    sqlQueryPadraoendereco: TStringField;
    sqlQueryPadraoestado: TStringField;
    sqlQueryPadraofk_doenca_pre_existente_id: TLargeintField;
    sqlQueryPadraofk_motivo_matricula_id: TLargeintField;
    sqlQueryPadraoid: TLargeintField;
    sqlQueryPadraonome: TStringField;
    sqlQueryPadraonome_mae: TStringField;
    sqlQueryPadraonome_pai: TStringField;
    sqlQueryPadraoobservacao: TStringField;
    sqlQueryPadraotelefone: TStringField;
    sqlQueryResponsavelcelular: TStringField;
    sqlQueryResponsavelemail: TStringField;
    sqlQueryResponsavelid: TLargeintField;
    sqlQueryResponsavelnome: TStringField;
    TabSheetGeral: TTabSheet;
    TabSheetResponsavel: TTabSheet;
    procedure btnNovoResponsavelClick(Sender: TObject);
    procedure dsPadraoStateChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure sqlQueryResponsavelBeforeOpen(DataSet: TDataSet);
  private

  public

  end;

var
  frmCadastroAlunos: TfrmCadastroAlunos;

implementation

uses
  uCadastroResponsavelFinanceiro;

{$R *.lfm}

{ TfrmCadastroAlunos }

procedure TfrmCadastroAlunos.FormShow(Sender: TObject);
begin
  captionForm := 'Cadastro de aluno';
  inherited;
  dblMotivo_Matricula.ListSource.DataSet.Open;
  dblDoenca_Pre_Existente.ListSource.DataSet.Open;
end;

procedure TfrmCadastroAlunos.PageControlChange(Sender: TObject);
begin
  dbNavAlunos.Enabled := not (TPageControl(Sender).ActivePage = TabSheetResponsavel);
  if TPageControl(Sender).ActivePage = TabSheetResponsavel then
    sqlQueryResponsavel.Open
  else
    sqlQueryResponsavel.Close;
end;

procedure TfrmCadastroAlunos.sqlQueryResponsavelBeforeOpen(DataSet: TDataSet);
begin
  sqlQueryResponsavel.Params[0].AsInteger:=sqlQueryPadraoid.AsInteger;
end;

procedure TfrmCadastroAlunos.dsPadraoStateChange(Sender: TObject);
begin
    // Será permitido informar um responsável se não estiver em edição e existir aluno.
   TabSheetResponsavel.Enabled := (TDataSource(Sender).State = dsBrowse) and not TDataSource(Sender).DataSet.IsEmpty;
end;

procedure TfrmCadastroAlunos.btnNovoResponsavelClick(Sender: TObject);
begin
  with TfrmCadastroResponsavelFinanceiro.Create(Application) do
  try
    sqlQueryPadrao.Params[0].AsInteger := Self.sqlQueryResponsavelid.AsInteger;
    sqlQueryPadrao.Open;
    pnlAluno.Caption := '  Aluno: ' + Self.sqlQueryPadraonome.AsString;
    id_aluno         := Self.sqlQueryPadraoid.AsInteger;
    case TBitBtn(Sender).Tag of
      1: sqlQueryPadrao.Insert;
      2: sqlQueryPadrao.Edit;
    end;
    ShowModal;
  finally
    PageControl.OnChange(PageControl);
    Free;
  end;
end;

procedure TfrmCadastroAlunos.FormDestroy(Sender: TObject);
begin
  dblMotivo_Matricula.ListSource.DataSet.Close;
  dblDoenca_Pre_Existente.ListSource.DataSet.Close;
  inherited;
end;


end.

