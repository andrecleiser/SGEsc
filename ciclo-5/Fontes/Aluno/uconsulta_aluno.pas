unit uconsulta_aluno;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, StdCtrls, DBGrids, uFormBase;

type

  TComportamentoConsulta = (ccEditar, ccRetornar, ccApenasAtivos);

  TComportamentosConsulta = Set of TComportamentoConsulta;

  { TfrmConsultaAluno }

  TfrmConsultaAluno = class(TfrmBase)
    btnConsultar: TBitBtn;
    btnEditar: TBitBtn;
    btnRetornar: TBitBtn;
    cbAlunoAtivo: TCheckBox;
    DBGrid1: TDBGrid;
    dsAlunos: TDataSource;
    edtTextoConsultar: TEdit;
    lblTextoConsulta: TLabel;
    Panel1: TPanel;
    pnlRetornar: TPanel;
    pnlEditar: TPanel;
    procedure btnConsultarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure cbAlunoAtivoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var {%H-}CloseAction: TCloseAction);
  private
    fCodigoAluno: integer;
  public
    class function abrirConsultaAluno(pComportamentosConsulta: TComportamentosConsulta): integer;
  end;

var
  frmConsultaAluno: TfrmConsultaAluno;

implementation

uses
  uCadastroAlunos, uDATMOD;

{$R *.lfm}

{ TfrmConsultaAluno }

class function TfrmConsultaAluno.abrirConsultaAluno(pComportamentosConsulta: TComportamentosConsulta): integer;
begin
  with TfrmConsultaAluno.Create(Application) do
  try
    fCodigoAluno := 0;
    pnlRetornar.Visible := (ccRetornar in pComportamentosConsulta);
    pnlEditar.Visible := (ccEditar in pComportamentosConsulta);
    cbAlunoAtivo.Visible := not (ccApenasAtivos in pComportamentosConsulta);
    ShowModal;
  finally
    Result := fCodigoAluno;
    Free;
  end;
end;

procedure TfrmConsultaAluno.btnConsultarClick(Sender: TObject);
var
  txt: string;
begin
  txt := edtTextoConsultar.Text;

  DataModuleApp.qryAlunoObj.Close;

  DataModuleApp.qryAlunoObj.Params.Clear;

  if cbAlunoAtivo.Checked then
    DataModuleApp.qryAlunoObj.ServerFilter := 'data_inativacao is null';

  if (txt.Trim.Length > 0) then
  begin
    if cbAlunoAtivo.Checked then
      DataModuleApp.qryAlunoObj.ServerFilter.Insert(DataModuleApp.qryAlunoObj.ServerFilter.Length, ' and nome like ' + QuotedStr('%' + txt.Trim + '%'))
    else
      DataModuleApp.qryAlunoObj.ServerFilter:='nome like ' + QuotedStr('%' + txt.Trim + '%');
  end;

  DataModuleApp.qryAlunoObj.ServerFiltered:= (DataModuleApp.qryAlunoObj.ServerFilter.Length > 0);

  DataModuleApp.qryAlunoObj.Open;

  btnRetornar.Enabled:=not DataModuleApp.qryAlunoObj.IsEmpty;
  btnEditar.Enabled:=not DataModuleApp.qryAlunoObj.IsEmpty;

  if DataModuleApp.qryAlunoObj.IsEmpty then
    raise Exception.Create('A pesquisa executada a partir do texto usado não encontrou nenhum aluno.');
end;

procedure TfrmConsultaAluno.btnEditarClick(Sender: TObject);
begin
  with TfrmCadastroAlunos.Create(Application) do
  try
    sqlQueryPadrao.ParamByName('id').AsInteger := DataModuleApp.qryAlunoObj.FieldByName('id').AsInteger;
    sqlQueryPadrao.Open;
    ShowModal;

    if DataModuleApp.qryAlunoObj.IsEmpty then
      btnConsultar.Click;
  finally
    Free;
  end;
end;

procedure TfrmConsultaAluno.btnRetornarClick(Sender: TObject);
begin
  if dsAlunos.DataSet.IsEmpty then
    raise Exception.Create('Nenhum aluno foi selecionado.');

  fCodigoAluno := dsAlunos.DataSet.FieldByName('id').AsInteger;

  btnSair.Click;
end;

procedure TfrmConsultaAluno.cbAlunoAtivoChange(Sender: TObject);
begin
  DataModuleApp.qryAlunoObj.Close;
end;

procedure TfrmConsultaAluno.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DataModuleApp.qryAlunoObj.Close;
end;

end.

