unit uCadCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uTelaHeranca, DB, ADODB, DBCtrls, Grids, DBGrids, StdCtrls, Buttons,
  Mask, ExtCtrls, ComCtrls, cCadCliente, uEnum, uDTMConexao;

type
  TfrmCadCliente = class(TfrmFormHeranca)
    QryListagemclienteId: TAutoIncField;
    QryListagemnome: TStringField;
    QryListagemendereco: TStringField;
    QryListagembairro: TStringField;
    QryListagemcep: TStringField;
    QryListagemtelefone: TStringField;
    QryListagememail: TStringField;
    edtClienteId: TLabeledEdit;
    edtNome: TLabeledEdit;
    lbl: TLabel;
    lbl1: TLabel;
    edtEndereco: TDBEdit;
    lbl2: TLabel;
    edtBairro: TDBEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    edtEmail: TDBEdit;
    mskeditCep: TMaskEdit;
    mskeditTelefone: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    oCliente:TCliente;
    function Apagar:Boolean; override;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean;override;

  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}

{ TfrmCadCliente }

function TfrmCadCliente.Apagar: Boolean;
begin
  if oCliente.Selecionar(QryListagem.FieldByName('clienteId').AsInteger) then
  begin
     Result:=oCliente.Apagar;
  end;
end;

procedure TfrmCadCliente.btnAlterarClick(Sender: TObject);
begin
  if oCliente.Selecionar(QryListagem.FieldByName('clienteId').AsInteger) then
  begin
     edtClienteId.Text    :=IntToStr(oCliente.codigo);
     edtNome.Text         :=oCliente.nome;
     mskeditCep.Text      :=oCliente.cep;
     edtEndereco.Text     :=oCliente.endereco;
     edtBairro.Text       :=oCliente.bairro;
     mskeditTelefone.Text :=oCliente.telefone;
     edtEmail.Text        :=oCliente.email;

  end
  else
  begin
    btnCancelar.Click;
    Abort;
  end;
  inherited;

end;


procedure TfrmCadCliente.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;

procedure TfrmCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oCliente) then
    FreeAndNil(oCliente);

end;

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  inherited;
  oCliente:=TCliente.Create(dtmPrincipal.ConexaoDB);

  IndiceAtual:='nome';
end;

function TfrmCadCliente.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if edtClienteId.Text<>EmptyStr then
     oCliente.codigo:=StrToInt(edtClienteId.Text)
  else
     oCliente.codigo:=0;

  oCliente.nome           :=edtNome.Text;
  oCliente.cep            :=mskeditCep.Text;
  oCliente.endereco       :=edtEndereco.Text;
  oCliente.bairro         :=edtBairro.Text;
  oCliente.telefone       :=mskeditTelefone.Text;
  oCliente.email          :=edtEmail.Text;

  if (EstadoDoCadastro=ecInserir) then
     Result:=oCliente.Inserir
  else if (EstadoDoCadastro=ecAlterar) then
     Result:=oCliente.Atualizar;
end;

end.
