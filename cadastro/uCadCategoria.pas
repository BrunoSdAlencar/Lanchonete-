unit uCadCategoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uTelaHeranca, DB, ADODB, DBCtrls, StdCtrls, Buttons, Grids, DBGrids,
  Mask, ExtCtrls, ComCtrls, cCadCategoria, uDTMConexao, uEnum;

type
  TfrmCadCategoria = class(TfrmFormHeranca)
    QryListagemcategoriaId: TAutoIncField;
    QryListagemdescricao: TStringField;
    edtCategoriaId: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    oCategoria:TCategoria;
    function Apagar:Boolean; override;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean; override;
  public
    { Public declarations }
  end;

var
  frmCadCategoria: TfrmCadCategoria;

implementation

{$R *.dfm}


{$REGION 'Override'}
function TfrmCadCategoria.Apagar: Boolean;
  begin
    if oCategoria.Selecionar(QryListagem.FieldByName('categoriaId').AsInteger) then
      begin
        Result:=oCategoria.Apagar;
      end;
  end;

function TfrmCadCategoria.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
  begin
    if (edtCategoriaId.Text <> EmptyStr) then
    oCategoria.codigo := StrToInt(edtCategoriaId.Text)
  else
    oCategoria.codigo := 0;

    oCategoria.descricao := edtDescricao.Text;

  if (EstadoDoCadastro = ecInserir) then
    Result := oCategoria.Inserir
  else if (EstadoDoCadastro = ecAlterar) then
    Result := oCategoria.Atualizar;
  end;

{$ENDREGION}

procedure TfrmCadCategoria.btnAlterarClick(Sender: TObject);
begin
  if oCategoria.Selecionar(QryListagem.FieldByName('categoriaId').AsInteger) then
    begin
      edtCategoriaId.Text:=IntToStr(oCategoria.codigo);
      edtDescricao.Text:=oCategoria.descricao;
    end
    else
    begin
     btnCancelar.Click;
     Abort;

    end;
  inherited;

end;

procedure TfrmCadCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oCategoria) then
      FreeAndNil(oCategoria);

end;

procedure TfrmCadCategoria.FormCreate(Sender: TObject);
begin
  inherited;
  oCategoria:=TCategoria.Create(dtmPrincipal.ConexaoDB);
  IndiceAtual:='descricao';
end;



end.
