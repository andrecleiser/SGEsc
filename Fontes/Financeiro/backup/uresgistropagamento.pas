{
insert into pagamento(id, fk_aluno_id, fk_turma_id, valor, ano, mes, observacao)
values (0, :fk_aluno_id, :fk_turma_id, :valor, :ano, :mes, :observacao)
on duplicate key update id=last_insert_id()

delete from pagamento where id = :OLD_id

update pagamento
set id,
    fk_aluno_id,
    fk_turma_id,
    valor,
    ano,
    mes,
    observacao
where id = :OLD_id
}

unit uResgistroPagamento;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, Buttons, DbCtrls, StdCtrls, DBGrids,
  uCadastroPadrao, uAluno;

type

  { TfrmRegistrarPagamento }

  TfrmRegistrarPagamento = class(TfrmCadastroPadrao)
    btnConsultarAluno: TBitBtn;
    btnConsultarAlunoPorNome: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    DBMemo1: TDBMemo;
    edtCodigoAluno: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblNomeAlunoFrente: TLabel;
    lblNomeAlunoFundo: TLabel;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    pnlDados: TPanel;
    sqlQueryPadraoano: TLargeintField;
    sqlQueryPadraodescricao: TStringField;
    sqlQueryPadraofk_aluno_id: TLargeintField;
    sqlQueryPadraofk_turma_id: TLargeintField;
    sqlQueryPadraoid: TLargeintField;
    sqlQueryPadraomes: TLargeintField;
    sqlQueryPadraoobservacao: TStringField;
    sqlQueryPadraovalor: TFloatField;
    procedure btnConsultarAlunoClick(Sender: TObject);
    procedure btnConsultarAlunoPorNomeClick(Sender: TObject);
    procedure edtCodigoAlunoEnter(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sqlQueryPadraoAfterInsert(DataSet: TDataSet);
  private
    aluno: TAluno;

    procedure validarCampoVazio;
    procedure atualizarDadosAluno;
    procedure mostrarDadosAluno(mostrar: boolean);

  public

  end;

var
  frmRegistrarPagamento: TfrmRegistrarPagamento;

implementation

uses
  uconsulta_aluno, uTurmaService, uFinanceiroService, uAlunoService;

{$R *.lfm}

{ TfrmRegistrarPagamento }

procedure TfrmRegistrarPagamento.btnConsultarAlunoClick(Sender: TObject);
var
  codigoAluno: string;
begin
  validarCampoVazio;

  codigoAluno := edtCodigoAluno.Text;

  try
    aluno := TAlunoService.obterAluno(codigoAluno.ToInteger, [saAtivo]);

    TFinanceiroService.validarAluno(aluno);
    atualizarDadosAluno;

    sqlQueryPadrao.Close;
    sqlQueryPadrao.Params[0].AsInteger := aluno.id;
    sqlQueryPadrao.Open;
  except
    edtCodigoAluno.SetFocus;
    raise;
  end;
end;

procedure TfrmRegistrarPagamento.btnConsultarAlunoPorNomeClick(Sender: TObject);
var
  codigoAluno: integer;
begin
  codigoAluno := TfrmConsultaAluno.abrirConsultaAluno(ccRetornar);
  if codigoAluno > 0 then
  begin
    edtCodigoAluno.Text:=codigoAluno.ToString;
    btnConsultarAluno.Click;
  end
  else
    edtCodigoAluno.SetFocus;
end;

procedure TfrmRegistrarPagamento.edtCodigoAlunoEnter(Sender: TObject);
begin
  mostrarDadosAluno(false);
end;

procedure TfrmRegistrarPagamento.FormDestroy(Sender: TObject);
begin
  if Assigned(aluno) then aluno.Free;
  inherited;
end;

procedure TfrmRegistrarPagamento.sqlQueryPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  sqlQueryPadraofk_aluno_id.AsInteger := aluno.id;
end;

{******************** MÉTODOS PRIVADOS **************************}

procedure TfrmRegistrarPagamento.validarCampoVazio;
var
  codigoAluno: string;
begin
  codigoAluno := edtCodigoAluno.Text;
  if codigoAluno.Trim.Length = 0 then
  begin
    edtCodigoAluno.SetFocus;
    raise Exception.Create('Informe o código do aluno!');
  end;
end;

procedure TfrmRegistrarPagamento.atualizarDadosAluno;
begin
  mostrarDadosAluno(true);

  lblNomeAlunoFrente.Caption:=aluno.nome;
  lblNomeAlunoFundo.Caption:=aluno.nome;
end;

procedure TfrmRegistrarPagamento.mostrarDadosAluno(mostrar: boolean);
begin
  lblNomeAlunoFrente.Visible:=mostrar;
  lblNomeAlunoFundo.Visible:=mostrar;
  pnlDados.Visible:=mostrar;
  pnlNav.Visible:=mostrar;
end;

end.

