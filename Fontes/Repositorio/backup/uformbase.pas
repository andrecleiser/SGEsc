unit uFormBase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons;

type

  { TfrmBase }

  TfrmBase = class(TForm)
    btnSair: TBitBtn;
    Panel1: TPanel;
    pnlBottom: TPanel;
    procedure btnSairClick(Sender: TObject);
  private

  public

  end;

var
  frmBase: TfrmBase;

implementation

{$R *.lfm}

{ TfrmBase }

procedure TfrmBase.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.

