unit uselecionarturmaaluno;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, DBGrids, uFormBase;

type

  { TfrmSelecionarTurmasAluno }

  TfrmSelecionarTurmasAluno = class(TfrmBase)
    dsTurma: TDataSource;
    DBGrid1: TDBGrid;
  private

  public

  end;

function getIdTurma(idAluno: integer): integer;

var
  frmSelecionarTurmasAluno: TfrmSelecionarTurmasAluno;

implementation

uses
  uAlunoService;

{$R *.lfm}

function getIdTurma(idAluno: integer): integer;
begin
  with TfrmSelecionarTurmasAluno.Create(Application) do
  try
    dsTurma.DataSet.Close;
    TSQLQuery(dsTurma.DataSet).ServerFilter := '(fk_aluno_id = ' + idAluno.ToString + ')';
    TSQLQuery(dsTurma.DataSet).ServerFiltered := true;
    dsTurma.DataSet.Open;

    // RecordCount não funciona. Por isso chamar o método
    if TAlunoService.obterTotalTurmas(idAluno) > 1 then
      ShowModal;

    if dsTurma.DataSet.IsEmpty then
      Result := -1
    else
      // Retorna turma selecionada
      Result := dsTurma.DataSet.FieldByName('fk_turma_id').AsInteger;
  finally
    dsTurma.DataSet.Filtered := false;
    dsTurma.DataSet.Filter := '';
    dsTurma.DataSet.Close;
    Free;
  end;
end;

end.

