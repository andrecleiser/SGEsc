unit uCadastroPadrao;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, FileUtil, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, DbCtrls, Buttons, LCLType;

type

  { TfrmCadastroPadrao }

  TfrmCadastroPadrao = class(TForm)
    btnSair: TBitBtn;
    dsPadrao: TDataSource;
    dbNavAlunos: TDBNavigator;
    pnlBottom: TPanel;
    pnlNav: TPanel;
    sqlQueryPadrao: TSQLQuery;
    procedure btnSairClick(Sender: TObject);
    procedure dsPadraoStateChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sqlQueryPadraoBeforeDelete(DataSet: TDataSet);
    procedure sqlQueryPadraoBeforePost(DataSet: TDataSet);
  private
    fTabela: String;
    fcampoChavePrimaria: String;
    fcaptionForm: String;

    function incrementarChavePrimaria(): boolean;

  protected
    property tabela: String             read fTabela         write fTabela;
    property campoChavePrimaria: String read fcampoChavePrimaria write fcampoChavePrimaria;
    property captionForm: String read fcaptionForm write fcaptionForm;

  public

  end;

var
  frmCadastroPadrao: TfrmCadastroPadrao;

implementation

uses
  uClassUtil, uDATMOD;

{$R *.lfm}

{ TfrmCadastroPadrao }

{**************************** Métodos public ***************************}
procedure TfrmCadastroPadrao.FormShow(Sender: TObject);
begin
  sqlQueryPadrao.Active := True;
end;

procedure TfrmCadastroPadrao.FormDestroy(Sender: TObject);
begin
  sqlQueryPadrao.Active := False;
end;

procedure TfrmCadastroPadrao.sqlQueryPadraoBeforeDelete(DataSet: TDataSet);
begin
  if Application.MessageBox('Deseja excluir o registro?', 'Exclusão', MB_ICONQUESTION + MB_YESNO) = idNo then
    raise Exception.Create('Exclusão cancelada!');
end;

procedure TfrmCadastroPadrao.sqlQueryPadraoBeforePost(DataSet: TDataSet);
begin
  if incrementarChavePrimaria() then
    DataSet.FieldByName(fcampoChavePrimaria).AsInteger := TUtil.incrementaChavePrimaria(TSQLQuery(DataSet).SQLConnection, ftabela, fcampoChavePrimaria);
end;

procedure TfrmCadastroPadrao.btnSairClick(Sender: TObject);
begin
  if sqlQueryPadrao.State in [dsInsert, dsEdit] then
    if Application.MessageBox('Deseja descartar as modificações?', 'Sair', MB_ICONQUESTION + MB_YESNO) = idNo then
      raise Exception.Create('Mantida a edição dos dados!');

  Close;
end;

procedure TfrmCadastroPadrao.dsPadraoStateChange(Sender: TObject);
begin
  case TDataSource(Sender).State of
    dsInsert: Self.Caption := captionForm + ' - [INCLUSÃO]';
    dsEdit: Self.Caption := captionForm + ' - [EDIÇÃO]';
  else Self.Caption := captionForm;
  end;
end;

{**************************** Métodos protected ***************************}


{**************************** Métodos privados ***************************}

function TfrmCadastroPadrao.incrementarChavePrimaria(): boolean;
begin
  result := (ftabela <> '') and (fcampoChavePrimaria <> '');
end;

end.

