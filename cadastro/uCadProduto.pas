unit uCadProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uTelaHeranca, DB, ADODB, DBCtrls, StdCtrls, Buttons, Grids, DBGrids,
  Mask, ExtCtrls, ComCtrls, cCadProduto, uEnum, uDTMConexao;

type
  TfrmCadProduto = class(TfrmFormHeranca)
    QryListagemprodutoId: TAutoIncField;
    QryListagemnome: TStringField;
    QryListagemdescricao: TStringField;
    QryListagemvalor: TFMTBCDField;
    QryListagemquantidade: TFMTBCDField;
    QryListagemcategoriaId: TIntegerField;
    QryListagemDescricaoCategoria: TStringField;
    edtProdutoId: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtDescricao: TMemo;
    lbl1: TLabel;
    edtValor: TEdit;
    lbl11: TLabel;
    lblQuantidade: TLabel;
    edtQuantidade: TEdit;
    lkpCategoria: TDBLookupComboBox;
    QryCategoria: TADOQuery;
    dtsCategoria: TDataSource;
    QryCategoriacategoriaId: TAutoIncField;
    QryCategoriadescricao: TStringField;
    lblCategoria: TLabel;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    oProduto:TProduto;
    function Apagar:Boolean; override;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean;override;
  public
    { Public declarations }
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

{$R *.dfm}



{ TfrmCadProduto }

{$REGION 'Override'}
function TfrmCadProduto.Apagar: Boolean;
begin
  if oProduto.Selecionar(QryListagem.FieldByName('produtoId').AsInteger) then begin
     Result:=oProduto.Apagar;
  end;
end;

function TfrmCadProduto.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if edtProdutoId.Text<>EmptyStr then
     oProduto.codigo:=StrToInt(edtProdutoId.Text)
  else
     oProduto.codigo:=0;

  oProduto.nome           :=edtNome.Text;
  oProduto.descricao      :=edtDescricao.Text;
  oProduto.categoriaId    :=lkpCategoria.KeyValue;
  oProduto.valor          :=StrToFloat(edtValor.text);
  oProduto.quantidade     :=StrToFloat(edtQuantidade.Text);

  if (EstadoDoCadastro=ecInserir) then
     Result:=oProduto.Inserir
  else if (EstadoDoCadastro=ecAlterar) then
     Result:=oProduto.Atualizar;
end;
{$ENDREGION}

{$REGION 'Botões'}
procedure TfrmCadProduto.btnAlterarClick(Sender: TObject);
begin
  if oProduto.Selecionar(QryListagem.FieldByName('produtoId').AsInteger) then begin
     edtProdutoId.Text                 :=IntToStr(oProduto.codigo);
     edtNome.Text                      :=oProduto.nome;
     edtDescricao.Text                 :=oProduto.descricao;
     lkpCategoria.KeyValue             :=oProduto.categoriaId;
     edtValor.Text                     :=FloatToStr(oProduto.valor);
     edtQuantidade.Text                :=FloatToStr(oProduto.quantidade);
  end
  else begin
    btnCancelar.Click;
    Abort;
  end;
  inherited;
end;

procedure TfrmCadProduto.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;

{$ENDREGION}

{$REGION 'Eventos'}
procedure TfrmCadProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  QryCategoria.Close;
  if Assigned(oProduto) then
    FreeAndNil(oProduto);
end;

procedure TfrmCadProduto.FormCreate(Sender: TObject);
begin
  inherited;
  oProduto:=Tproduto.Create(dtmPrincipal.ConexaoDB);
  IndiceAtual:='nome';
end;

procedure TfrmCadProduto.FormShow(Sender: TObject);
begin
  inherited;
  QryCategoria.Open;
end;
{$ENDREGION}
end.
