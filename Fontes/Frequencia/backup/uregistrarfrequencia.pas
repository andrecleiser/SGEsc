unit uRegistrarFrequencia;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, StdCtrls, MaskEdit, uFormBase, uAluno, uFrequenciaService, LCLType,
  sqldb, uAlunoService;

type

  { TfrmRegistrarFrequencia }

  TfrmRegistrarFrequencia = class(TfrmBase)
    btnConsultarAlunoPorNome: TBitBtn;
    btnRegistrarFrequencia: TBitBtn;
    btnConsultarAluno: TBitBtn;
    edtCodigoAluno: TEdit;
    Label1: TLabel;
    lblNomeAlunoFundo: TLabel;
    lblNomeAlunoFrente: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure btnConsultarAlunoPorNomeClick(Sender: TObject);
    procedure btnConsultarAlunoClick(Sender: TObject);
    procedure btnRegistrarFrequenciaClick(Sender: TObject);
    procedure edtCodigoAlunoEnter(Sender: TObject);
  private
    aluno: TAluno;

    procedure validarCampoVazio;
    procedure atualizarDadosAluno;
    procedure limparAluno;
  public

  end;

var
  frmRegistrarFrequencia: TfrmRegistrarFrequencia;

implementation

uses
  uconsulta_aluno;

{$R *.lfm}

{ TfrmRegistrarFrequencia }

procedure TfrmRegistrarFrequencia.btnRegistrarFrequenciaClick(Sender: TObject);
begin
  TFrequenciaService.registrarFrequencia(aluno.id);
  limparAluno;
end;

procedure TfrmRegistrarFrequencia.edtCodigoAlunoEnter(Sender: TObject);
begin
  lblNomeAlunoFrente.Visible:=false;
  lblNomeAlunoFundo.Visible:=false;
  btnRegistrarFrequencia.Enabled:=false;
end;

procedure TfrmRegistrarFrequencia.btnConsultarAlunoClick(Sender: TObject);
var
  codigoAluno: string;
begin
  validarCampoVazio;

  codigoAluno := edtCodigoAluno.Text;

  try
    aluno := TAlunoService.obterAluno(codigoAluno.ToInteger, [saAtivo]);
    if Assigned(aluno) then
      atualizarDadosAluno;
  except
    edtCodigoAluno.SetFocus;
    raise;
  end;
end;

procedure TfrmRegistrarFrequencia.btnConsultarAlunoPorNomeClick(Sender: TObject);
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

{******************** MÉTODOS PRIVADOS **************************}

procedure TfrmRegistrarFrequencia.limparAluno;
begin
  edtCodigoAluno.Clear;
  edtCodigoAluno.SetFocus;
end;

procedure TfrmRegistrarFrequencia.validarCampoVazio;
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

procedure TfrmRegistrarFrequencia.atualizarDadosAluno;
begin
  lblNomeAlunoFrente.Visible:=True;
  lblNomeAlunoFundo.Visible:=True;

  lblNomeAlunoFrente.Caption:=aluno.nome;
  lblNomeAlunoFundo.Caption:=aluno.nome;

  if aluno.adimplente = 'N' then
    lblNomeAlunoFrente.Font.Color := clRed
  else
    lblNomeAlunoFrente.Font.Color := clBlue;

  btnRegistrarFrequencia.Enabled:=true;
  btnRegistrarFrequencia.SetFocus;
end;

end.
