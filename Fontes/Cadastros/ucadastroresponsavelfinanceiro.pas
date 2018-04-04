unit uCadastroResponsavelFinanceiro;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, FileUtil, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, DbCtrls, Buttons, StdCtrls, uCadastroPadrao;

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
    sqlQueryPadraocelular: TStringField;
    sqlQueryPadraocpf: TStringField;
    sqlQueryPadraoemail: TStringField;
    sqlQueryPadraofk_aluno_id: TLargeintField;
    sqlQueryPadraoid: TLargeintField;
    sqlQueryPadraonome: TStringField;
    sqlQueryPadraorg: TStringField;
    sqlQueryPadraotelefone: TStringField;
    procedure FormShow(Sender: TObject);
    procedure sqlQueryPadraoBeforePost(DataSet: TDataSet);
  private
    fid_aluno: Integer;
  public
    property id_aluno: Integer read fid_aluno write fid_aluno;
  end;

var
  frmCadastroResponsavelFinanceiro: TfrmCadastroResponsavelFinanceiro;

implementation

{$R *.lfm}

{ TfrmCadastroResponsavelFinanceiro }

procedure TfrmCadastroResponsavelFinanceiro.sqlQueryPadraoBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  sqlQueryPadraofk_aluno_id.AsInteger := id_aluno;
end;

procedure TfrmCadastroResponsavelFinanceiro.FormShow(Sender: TObject);
begin
  captionForm := 'CADASTRO DE RESPONSÁVEL FINANCEIRO';
  inherited;
end;

end.

