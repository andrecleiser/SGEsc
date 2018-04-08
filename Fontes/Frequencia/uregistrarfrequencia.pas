unit uRegistrarFrequencia;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, StdCtrls, MaskEdit, uFormBase, uAluno, uFrequenciaService, LCLType,
  sqldb;

type

  { TfrmRegistrarFrequencia }

  TfrmRegistrarFrequencia = class(TfrmBase)
    BitBtn1: TBitBtn;
    btnRegistrarFrequencia: TBitBtn;
    BitBtn3: TBitBtn;
    edtCodigoAluno: TEdit;
    Label1: TLabel;
    lblNomeAlunoFundo: TLabel;
    lblNomeAlunoFrente: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure BitBtn3Click(Sender: TObject);
    procedure btnRegistrarFrequenciaClick(Sender: TObject);
    procedure edtCodigoAlunoEnter(Sender: TObject);
  private
    aluno: TAluno;

    procedure validarCampoVazio;

  public

  end;

var
  frmRegistrarFrequencia: TfrmRegistrarFrequencia;

implementation

uses
  uDATMOD;

{$R *.lfm}

{ TfrmRegistrarFrequencia }

{******************** MÉTODOS PÚBLICOS ************************}
procedure TfrmRegistrarFrequencia.btnRegistrarFrequenciaClick(Sender: TObject);
{var
  qry: TSQLQuery;}
begin
  validarCampoVazio;
  TFrequenciaService.registrarFrequencia(aluno.id);
  edtCodigoAluno.Clear;
  edtCodigoAluno.SetFocus;
end;

procedure TfrmRegistrarFrequencia.edtCodigoAlunoEnter(Sender: TObject);
begin
  lblNomeAlunoFrente.Visible:=false;
  lblNomeAlunoFundo.Visible:=false;
end;

procedure TfrmRegistrarFrequencia.BitBtn3Click(Sender: TObject);
var
  codigoAluno: string;
begin
  validarCampoVazio;

  codigoAluno := edtCodigoAluno.Text;

  try
    aluno := TFrequenciaService.obterAluno(codigoAluno.ToInteger);

    lblNomeAlunoFrente.Visible:=True;
    lblNomeAlunoFundo.Visible:=True;

    lblNomeAlunoFrente.Caption:=aluno.nome;
    lblNomeAlunoFundo.Caption:=aluno.nome;

    btnRegistrarFrequencia.SetFocus;
  except
    edtCodigoAluno.SetFocus;
    raise;
  end;
end;


{******************** MÉTODOS PRIVADOS **************************}
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

end.



































