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
    lblFaturamento: TLabel;
    Panel1: TPanel;
    pnlAluno: TPanel;
    pnlAlunoPagamentos: TPanel;
    pnlDadosGerais: TPanel;
    sqlAlunodia_vencimento: TLargeintField;
    sqlAlunoid: TLargeintField;
    sqlAlunonome: TStringField;
    sqlAlunoPagamentos: TSQLQuery;
    sqlAlunoPagamentosdescricao: TStringField;
    sqlAlunoPagamentoshora_inicio: TStringField;
    sqlAlunoPagamentosmes_pagamento: TStringField;
    sqlAlunoPagamentosvalor: TFloatField;
    sqlAluno: TSQLQuery;
    sqlFaturamento: TSQLQuery;
    sqlFaturamentomes_pagamento: TStringField;
    sqlFaturamentovalor: TFloatField;
    procedure editButtonFiltroButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

end.

