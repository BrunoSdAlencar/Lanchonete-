unit uCadCategoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uTelaHeranca, DB, ADODB, DBCtrls, StdCtrls, Buttons, Grids, DBGrids,
  Mask, ExtCtrls, ComCtrls;

type
  TfrmCadCategoria = class(TfrmFormHeranca)
    QryListagemcategoriaId: TAutoIncField;
    QryListagemdescricao: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCategoria: TfrmCadCategoria;

implementation

{$R *.dfm}

end.
