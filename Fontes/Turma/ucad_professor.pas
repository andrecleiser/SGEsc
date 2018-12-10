unit ucad_professor;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, FileUtil, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, DbCtrls, StdCtrls, DBGrids, uCadastroPadrao;

type

  { TfrmCadastroProfessor }

  TfrmCadastroProfessor = class(TfrmCadastroPadrao)
    DBEdit1: TDBEdit;
    dbeNome: TDBEdit;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Panel3: TPanel;
    sqlQueryPadraoid: TLargeintField;
    sqlQueryPadraonome: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sqlQueryPadraoBeforePost(DataSet: TDataSet);
  private

  public

  end;

var
  frmCadastroProfessor: TfrmCadastroProfessor;

implementation

{$R *.lfm}

{ TfrmCadastroProfessor }

procedure TfrmCadastroProfessor.sqlQueryPadraoBeforePost(DataSet: TDataSet);
begin
  // A descrição deve ter no mínimo 10 caracteres
  if dataSet.FieldByName('nome').IsNull or (dataSet.FieldByName('nome').AsString.Trim.Length < 10) or (dataSet.FieldByName('nome').AsString.Trim.Length > 70) then
  begin
    dbeNome.SetFocus;
    raise Exception.Create('O nome do professor deve conter entre 10 e 70 caracteres.');
  end;

  inherited;
end;

procedure TfrmCadastroProfessor.FormCreate(Sender: TObject);
begin
  inherited;
  sqlQueryPadrao.Open;
end;

procedure TfrmCadastroProfessor.FormShow(Sender: TObject);
begin
  captionForm := 'Cadastro de professor';
  inherited;
end;

end.

