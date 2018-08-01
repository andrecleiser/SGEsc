unit uFichaFinanceira;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, FileUtil, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, StdCtrls, DBGrids, DbCtrls, uFormBase;

type

  { TfrmFichaFinanceira }

  TfrmFichaFinanceira = class(TfrmBase)
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    dsALunos: TDataSource;
    dsAlunoPagamentos: TDataSource;
    dbGridAlunos: TDBGrid;
    dbGridAlunosPagamentos: TDBGrid;
    edtTotalAlunosAtivos: TEdit;
    edtTotalAlunosAtivos1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    pnlAluno: TPanel;
    pnlAlunoPagamentos: TPanel;
    pnlDadosGerais: TPanel;
    sqlAlunodia_vencimento: TLargeintField;
    sqlAlunofk_turma_id: TLargeintField;
    sqlAlunoid: TLargeintField;
    sqlAlunonome: TStringField;
    sqlAlunoPagamentos: TSQLQuery;
    sqlAlunoPagamentosdescricao: TStringField;
    sqlAlunoPagamentosmes_pagamento: TStringField;
    sqlAlunoPagamentosvalor: TFloatField;
    sqlAluno: TSQLQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure sqlAlunoAfterScroll(DataSet: TDataSet);
  private

  public

  end;

var
  frmFichaFinanceira: TfrmFichaFinanceira;

implementation

uses
 uDATMOD;

{$R *.lfm}

{ TfrmFichaFinanceira }

procedure TfrmFichaFinanceira.BitBtn1Click(Sender: TObject);
begin
  sqlAlunoPagamentos.Open;
  pnlAlunoPagamentos.Show;
end;

procedure TfrmFichaFinanceira.sqlAlunoAfterScroll(DataSet: TDataSet);
begin
  pnlAlunoPagamentos.Hide;
  if sqlAlunoPagamentos.Active then
    sqlAlunoPagamentos.Close;
end;

end.

