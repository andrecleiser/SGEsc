unit uResgistroPagamento;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, Buttons, DbCtrls, StdCtrls, DBGrids,
  uCadastroPadrao;

type

  { TfrmCadastroPadrao1 }

  TfrmCadastroPadrao1 = class(TfrmCadastroPadrao)
    btnConsultarAluno: TBitBtn;
    btnConsultarAlunoPorNome: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    DBMemo1: TDBMemo;
    edtCodigoAluno: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblNomeAlunoFrente: TLabel;
    lblNomeAlunoFundo: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    pnlDados: TPanel;
    Panel4: TPanel;
  private

  public

  end;

var
  frmCadastroPadrao1: TfrmCadastroPadrao1;

implementation

{$R *.lfm}

end.

