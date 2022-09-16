unit uCadCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uTelaHeranca, DB, ADODB, DBCtrls, Grids, DBGrids, StdCtrls, Buttons,
  Mask, ExtCtrls, ComCtrls;

type
  TfrmCadCliente = class(TfrmFormHeranca)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}

end.
