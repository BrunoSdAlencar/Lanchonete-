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
    edtCategoriaId: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCategoria: TfrmCadCategoria;

implementation

{$R *.dfm}

procedure TfrmCadCategoria.btnGravarClick(Sender: TObject);
begin
  if edtDescricao.Text=EmptyStr then
    begin
      ShowMessage('Campo Obrigatorio');
      edtDescricao.SetFocus;
      Abort;
    end;

  inherited;

end;

end.
