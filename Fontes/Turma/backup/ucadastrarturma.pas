unit uCadastrarTurma;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, FileUtil, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, DbCtrls, DBGrids, StdCtrls, uCadastroPadrao;

type

  { TfrmCadastroTurma }

  TfrmCadastroTurma = class(TfrmCadastroPadrao)
    DBCheckBox1: TDBCheckBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    sqlQueryPadraocontrolar_horario: TStringField;
    sqlQueryPadraodescricao: TStringField;
    sqlQueryPadraofk_perfil_professor_id: TLargeintField;
    sqlQueryPadraohora_fim: TStringField;
    sqlQueryPadraohora_inicio: TStringField;
    sqlQueryPadraoid: TLargeintField;
    sqlQueryPadraolimite_alunos: TLargeintField;
    sqlQueryPadraovalor_sugerido: TFloatField;
    procedure FormClose(Sender: TObject; var {%H-}CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sqlQueryPadraoAfterInsert(DataSet: TDataSet);
    procedure sqlQueryPadraoBeforePost(DataSet: TDataSet);
  private

  public

  end;

var
  frmCadastroTurma: TfrmCadastroTurma;

implementation

uses
  uDATMOD, uTurmaService;

{$R *.lfm}

{ TfrmCadastroTurma }

procedure TfrmCadastroTurma.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  sqlQueryPadrao.Close;
  DataModuleApp.qryLookUpProfessor.Close;
end;

procedure TfrmCadastroTurma.FormCreate(Sender: TObject);
begin
  inherited;
  sqlQueryPadrao.Open;
end;

procedure TfrmCadastroTurma.FormShow(Sender: TObject);
begin
  captionForm := 'Cadastro de turma';
  inherited;
  DataModuleApp.qryLookUpProfessor.Open;
  sqlQueryPadrao.Open;
end;

procedure TfrmCadastroTurma.sqlQueryPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  sqlQueryPadraocontrolar_horario.AsString := 'S';
end;

procedure TfrmCadastroTurma.sqlQueryPadraoBeforePost(DataSet: TDataSet);
begin
  TTurmaService.validarTurma(DataSet);

  inherited;
end;

end.

