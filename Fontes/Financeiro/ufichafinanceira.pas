unit uFichaFinanceira;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, FileUtil, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, Buttons, StdCtrls, DBGrids, DbCtrls, EditBtn,
  uFormBase, DateUtils;

type

  { TfrmFichaFinanceira }

  TfrmFichaFinanceira = class(TfrmBase)
    Button1: TButton;
    cbMes: TComboBox;
    dsFaturamento: TDataSource;
    DBGrid1: TDBGrid;
    dsALunos: TDataSource;
    dsAlunoPagamentos: TDataSource;
    dbGridAlunos: TDBGrid;
    dbGridAlunosPagamentos: TDBGrid;
    editButtonFiltro: TEditButton;
    edtTotalAlunosAtivos: TEdit;
    edtTotalAlunosInadimplentes: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblFaturamento: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    pnlAluno: TPanel;
    pnlAlunoPagamentos: TPanel;
    pnlDadosGerais: TPanel;
    rgAdimplente: TRadioGroup;
    sqlAlunoadimplente: TBooleanField;
    sqlAlunodia_vencimento: TLargeintField;
    sqlAlunoid: TLargeintField;
    sqlAlunonome: TStringField;
    sqlAlunoPagamentos: TSQLQuery;
    sqlAlunoPagamentosdescricao: TStringField;
    sqlAlunoPagamentoshora_inicio: TStringField;
    sqlAlunoPagamentosmes: TLargeintField;
    sqlAlunoPagamentosmes_pagamento: TStringField;
    sqlAlunoPagamentosvalor: TFloatField;
    sqlAluno: TSQLQuery;
    sqlFaturamento: TSQLQuery;
    sqlFaturamentomes_pagamento: TStringField;
    sqlFaturamentovalor: TFloatField;
    procedure Button1Click(Sender: TObject);
    procedure editButtonFiltroButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rgAdimplenteClick(Sender: TObject);
    procedure sqlAlunoCalcFields({%H-}DataSet: TDataSet);
  private

  public

  end;

var
  frmFichaFinanceira: TfrmFichaFinanceira;

implementation

uses
 uAlunoService, uFinanceiroService;

{$R *.lfm}

{ TfrmFichaFinanceira }

procedure TfrmFichaFinanceira.FormShow(Sender: TObject);
begin
  sqlAluno.Open;
  sqlAlunoPagamentos.Open;
  sqlFaturamento.Open;

  lblFaturamento.Caption := Format(lblFaturamento.Caption, [YearOf(Today()).ToString()]);
  edtTotalAlunosAtivos.Text := TAlunoService.totalAlunosAtivos().ToString();
  edtTotalAlunosInadimplentes.Text := TFinanceiroService.totalAlunoInadimplente().ToString();
end;

procedure TfrmFichaFinanceira.rgAdimplenteClick(Sender: TObject);
begin
  sqlAluno.Filtered := (rgAdimplente.ItemIndex > 0);
  case rgAdimplente.ItemIndex of
    1: sqlAluno.Filter := 'adimplente';
    2: sqlAluno.Filter := 'not adimplente';
  end;
end;

procedure TfrmFichaFinanceira.sqlAlunoCalcFields(DataSet: TDataSet);
var
  listaIDTurmas: TStrings;
  i: integer;
begin
  listaIDTurmas := TStringList.Create;
  try
    listaIDTurmas.DelimitedText := TAlunoService.obterIDsTurmas(sqlAlunoid.AsInteger);

    for i := 0 to listaIDTurmas.Count - 1 do
    begin
      sqlAlunoadimplente.AsBoolean := not TFinanceiroService.estaInadimplente(sqlAlunoid.AsInteger, listaIDTurmas[i].ToInteger, sqlAlunodia_vencimento.AsInteger);
      if not sqlAlunoadimplente.AsBoolean then
        Break;
    end;
  finally
    listaIDTurmas.Free;
  end;
end;

procedure TfrmFichaFinanceira.FormCreate(Sender: TObject);
begin
  sqlFaturamento.Close;
  sqlAlunoPagamentos.Close;
  sqlAluno.Close;
end;

procedure TfrmFichaFinanceira.editButtonFiltroButtonClick(Sender: TObject);
var
  txt: string;
begin
  txt := editButtonFiltro.Text;
  sqlAluno.Close;
  if (txt.Trim.Length > 0) then
    sqlAluno.ServerFilter := 'nome like ' + QuotedStr(txt.Trim + '%')
  else
    sqlAluno.ServerFilter := '';

  sqlAluno.ServerFiltered:=(txt.Trim.Length > 0);
  sqlAluno.Open;
end;

procedure TfrmFichaFinanceira.Button1Click(Sender: TObject);
begin
  sqlAlunoPagamentos.Close;
  sqlAlunoPagamentos.ServerFiltered := (cbMes.ItemIndex > 0);

  if cbMes.ItemIndex > 0 then
    sqlAlunoPagamentos.ServerFilter := 'mes = ' + cbMes.ItemIndex.ToString
  else
    sqlAlunoPagamentos.ServerFilter := '';

  sqlAlunoPagamentos.Open;
end;

end.
