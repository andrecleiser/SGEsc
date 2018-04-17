unit uCadastroPadrao;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, FileUtil, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, DbCtrls, Buttons, LCLType, uFormBase, BufDataset;

type

  { TfrmCadastroPadrao }

  TfrmCadastroPadrao = class(TfrmBase)
    dsPadrao: TDataSource;
    dbNavAlunos: TDBNavigator;
    pnlNav: TPanel;
    sqlQueryPadrao: TSQLQuery;
    procedure btnSairClick(Sender: TObject);
    procedure dsPadraoStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sqlQueryPadraoAfterDelete({%H-}DataSet: TDataSet);
    procedure sqlQueryPadraoAfterEdit({%H-}DataSet: TDataSet);
    procedure sqlQueryPadraoAfterInsert({%H-}DataSet: TDataSet);
    procedure sqlQueryPadraoAfterPost(DataSet: TDataSet);
    procedure sqlQueryPadraoBeforeDelete({%H-}DataSet: TDataSet);
    procedure sqlQueryPadraoBeforePost(DataSet: TDataSet);
  private
    fTabela: String;
    fcampoChavePrimaria: String;
    fcaptionForm: String;
    fcampoFocoEdicao: TWinControl;

    function incrementarChavePrimaria(): boolean;
    procedure salvarDadosDataSet;

  protected
    property tabela: String             read fTabela         write fTabela;
    property campoChavePrimaria: String read fcampoChavePrimaria write fcampoChavePrimaria;
    property captionForm: String read fcaptionForm write fcaptionForm;
    property campoFocoEdicao: TWinControl read fcampoFocoEdicao write fcampoFocoEdicao;

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
procedure TfrmCadastroPadrao.FormCreate(Sender: TObject);
begin
  // ALGUNS FORMS PODEM NÃO USAR ESTE EVENTO PARA CONTROLAR A ABERTURA DO DATASET
  // CONSIDERAR ISSO EM IMPLEMENTAÇÕES FUTURAS
  sqlQueryPadrao.Close;
end;
procedure TfrmCadastroPadrao.FormDestroy(Sender: TObject);
begin
  sqlQueryPadrao.Close;
end;

procedure TfrmCadastroPadrao.sqlQueryPadraoAfterDelete(DataSet: TDataSet);
begin
  salvarDadosDataSet;
end;

procedure TfrmCadastroPadrao.sqlQueryPadraoAfterEdit(DataSet: TDataSet);
begin
  if Assigned(campoFocoEdicao) then
    campoFocoEdicao.SetFocus;
end;

procedure TfrmCadastroPadrao.sqlQueryPadraoAfterInsert(DataSet: TDataSet);
begin
  if Assigned(campoFocoEdicao) then
    campoFocoEdicao.SetFocus;
end;

procedure TfrmCadastroPadrao.sqlQueryPadraoBeforePost(DataSet: TDataSet);
begin
  DataSet.Tag:=1;
  if DataSet.State = dsInsert then
  begin
    if incrementarChavePrimaria() then
      DataSet.FieldByName(fcampoChavePrimaria).AsInteger := TUtil.incrementaChavePrimaria(TSQLQuery(DataSet).SQLConnection, ftabela, fcampoChavePrimaria);
  end
  else if DataSet.State = dsEdit then
  begin
    if not DataSet.Modified then
      DataSet.Tag:=0;
  end;
end;

procedure TfrmCadastroPadrao.sqlQueryPadraoAfterPost(DataSet: TDataSet);
begin
  if DataSet.Tag = 1 then
  begin
    DataSet.Tag := 0;
    salvarDadosDataSet;
  end;
end;

procedure TfrmCadastroPadrao.sqlQueryPadraoBeforeDelete(DataSet: TDataSet);
begin
  if Application.MessageBox('Deseja excluir o registro?', 'Exclusão', MB_ICONQUESTION + MB_YESNO) = idNo then
    raise Exception.Create('Exclusão cancelada!');
end;

procedure TfrmCadastroPadrao.btnSairClick(Sender: TObject);
begin
  if sqlQueryPadrao.State in [dsInsert, dsEdit] then
    if Application.MessageBox('Deseja descartar as modificações?', 'Sair', MB_ICONQUESTION + MB_YESNO) = idNo then
      raise Exception.Create('Dados em edição!');

  inherited;
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

procedure TfrmCadastroPadrao.salvarDadosDataSet;
begin
  sqlQueryPadrao.ApplyUpdates;
  DataModuleApp.sqlTransactionGeral.CommitRetaining;
end;

end.

