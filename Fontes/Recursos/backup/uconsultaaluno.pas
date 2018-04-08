unit uConsultaAluno;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, StdCtrls, DBGrids, uFormBase, uAluno;

type

  { TfrmConsultaAluno }

  TfrmConsultaAluno = class(TfrmBase)
    btnConsultar: TBitBtn;
    btnEditarResponsavel: TBitBtn;
    btnRetornar: TBitBtn;
    DBGrid1: TDBGrid;
    dsAlunos: TDataSource;
    edtTextoConsultar: TEdit;
    lblTextoConsulta: TLabel;
    Panel1: TPanel;
    procedure btnConsultarClick(Sender: TObject);
    procedure btnEditarResponsavelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public
     function obterAlunoSelecionado: TAluno;
  end;

var
  frmConsultaAluno: TfrmConsultaAluno;

implementation

uses
  uCadastroAlunos, uDATMOD;

{$R *.lfm}

{ TfrmConsultaAluno }

procedure TfrmConsultaAluno.btnConsultarClick(Sender: TObject);
var
  txt: string;
begin
  txt := edtTextoConsultar.Text;

  DataModuleApp.qryAlunoObj.Close;

  if txt.Trim.Length > 0 then
  begin
    DataModuleApp.qryAlunoObj.Params.Clear;
    DataModuleApp.qryAlunoObj.ServerFilter:='nome like ' + QuotedStr('%' + txt.Trim + '%') + ' and data_inativacao is null';
    DataModuleApp.qryAlunoObj.ServerFiltered:=true;
  end;

  DataModuleApp.qryAlunoObj.Open;

  btnRetornar.Enabled:=not DataModuleApp.qryAlunoObj.IsEmpty;

  if DataModuleApp.qryAlunoObj.IsEmpty then
    raise Exception.Create('A pesquisa executada a partir do texto usado não encontrou nenhum aluno.');
end;

procedure TfrmConsultaAluno.btnEditarResponsavelClick(Sender: TObject);
begin
  if DataModuleApp.qryAlunoObj.IsEmpty then
    raise Exception.Create('Nenhum aluno encontrado.');

  with TfrmCadastroAlunos.Create(Application) do
  try
    sqlQueryPadrao.ParamByName('id').AsInteger := DataModuleApp.qryAlunoObj.FieldByName('id').AsInteger;
    sqlQueryPadrao.Open;
    sqlQueryPadrao.Edit;
    ShowModal;

    if DataModuleApp.qryAlunoObj.IsEmpty then
      btnConsultar.Click;
  finally
    Free;
  end;
end;

procedure TfrmConsultaAluno.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DataModuleApp.qryAlunoObj.Close;
end;

function TfrmConsultaAluno.obterAlunoSelecionado: TAluno;
begin
  result := TAluno.create(qryAlunos);
  btnSair.Click;
end;

end.

