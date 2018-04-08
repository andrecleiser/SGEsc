unit uCadastroResponsavelFinanceiro;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, FileUtil, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, DbCtrls, Buttons, StdCtrls, uCadastroPadrao, uResponsavelService;

type

  { TfrmCadastroResponsavelFinanceiro }

  TfrmCadastroResponsavelFinanceiro = class(TfrmCadastroPadrao)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    pnlAluno: TPanel;
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sqlQueryPadraoBeforePost(DataSet: TDataSet);
  private
    fid_aluno: Integer;

    responsavelService: TResponsavelService;
  public
    property id_aluno: Integer read fid_aluno write fid_aluno;
  end;

var
  frmCadastroResponsavelFinanceiro: TfrmCadastroResponsavelFinanceiro;

implementation

uses
  uClassUtil;

{$R *.lfm}

{ TfrmCadastroResponsavelFinanceiro }

procedure TfrmCadastroResponsavelFinanceiro.FormCreate(Sender: TObject);
begin
  inherited;
  sqlQueryPadrao.Params.Clear;
  sqlQueryPadrao.Params.CreateParam(ftInteger, 'id', ptInput);
  sqlQueryPadrao.ServerFiltered:=true;
end;

procedure TfrmCadastroResponsavelFinanceiro.FormShow(Sender: TObject);
begin
  captionForm := 'CADASTRO DE RESPONSÁVEL FINANCEIRO';
  responsavelService := TResponsavelService.create(sqlQueryPadrao);
end;

procedure TfrmCadastroResponsavelFinanceiro.FormDestroy(Sender: TObject);
begin
  responsavelService.Free;
  inherited;
end;

procedure TfrmCadastroResponsavelFinanceiro.sqlQueryPadraoBeforePost(
  DataSet: TDataSet);
begin
  responsavelService.validarDados;
  if DataSet.State = dsInsert then
    sqlQueryPadrao.FieldByName('fk_aluno_id').AsInteger := id_aluno;
  inherited;
end;

procedure TfrmCadastroResponsavelFinanceiro.DBEdit6Exit(Sender: TObject);
begin
  if not sqlQueryPadrao.FieldByName('email').IsNull then
    TUtil.validar_Email(sqlQueryPadrao.FieldByName('email').AsString);
end;

procedure TfrmCadastroResponsavelFinanceiro.DBEdit2Exit(Sender: TObject);
begin
  if not sqlQueryPadrao.FieldByName('cpf').IsNull then
    TUtil.CheckCPF(sqlQueryPadrao.FieldByName('cpf').AsString);
end;

end.

