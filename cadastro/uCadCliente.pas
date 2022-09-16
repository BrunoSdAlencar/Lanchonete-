unit uCadCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uTelaHeranca, DB, ADODB, DBCtrls, Grids, DBGrids, StdCtrls, Buttons,
  Mask, ExtCtrls, ComCtrls;

type
  TfrmCadCliente = class(TfrmFormHeranca)
    QryListagemclientesId: TAutoIncField;
    QryListagemnome: TStringField;
    QryListagemendereco: TStringField;
    QryListagemtelefone: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  inherited;
  IndiceAtual:='nome';
end;

end.
