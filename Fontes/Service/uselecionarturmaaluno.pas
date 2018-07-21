unit uselecionarturmaaluno;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, DBGrids, uFormBase;

type

  { TfrmBase1 }

  TfrmBase1 = class(TfrmBase)
    DBGrid1: TDBGrid;
  private

  public

  end;

var
  frmBase1: TfrmBase1;

implementation

{$R *.lfm}

end.

