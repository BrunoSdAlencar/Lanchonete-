unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, uDTMConexao, StdCtrls;

type
  TfrmPrincipal = class(TForm)
    mainPrincipal: TMainMenu;
    CADASTRO1: TMenuItem;
    MOVIMENTAO1: TMenuItem;
    RELATORIOS1: TMenuItem;
    CLIENTES1: TMenuItem;
    N1: TMenuItem;
    PRODUTOS1: TMenuItem;
    N2: TMenuItem;
    USUARIO1: TMenuItem;
    ALTERARSENHA1: TMenuItem;
    N3: TMenuItem;
    SAIR1: TMenuItem;
    VENDAS1: TMenuItem;
    CATEGORIA1: TMenuItem;
    procedure SAIR1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CLIENTES1Click(Sender: TObject);
    procedure CATEGORIA1Click(Sender: TObject);
    procedure PRODUTOS1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uCadCliente, uCadCategoria, uCadProduto;

{$R *.dfm}

procedure TfrmPrincipal.CATEGORIA1Click(Sender: TObject);
begin
  frmCadCategoria:=TfrmCadCategoria.Create(Self);
  frmCadCategoria.ShowModal;
  frmCadCategoria.Release;
end;

procedure TfrmPrincipal.CLIENTES1Click(Sender: TObject);
begin
  frmCadCliente:=TfrmCadCliente.Create(Self);
  frmCadCliente.ShowModal;
  frmCadCliente.Release;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  dtmPrincipal := TdtmPrincipal.Create(Self);
  {with dtmPrincipal.ConexaoDB do
  begin
    Provider=SQLOLEDB.1;
    Password=rt6666;
    Persist Security Info=True;
    User ID=sa;
    Initial Catalog=LanchoneteDB;
    Data Source=DESKTOP-5TJOKC3\SERVERCURSO;
  end; }



  if not dtmPrincipal.ConexaoDB.Connected then
    //ShowMessage('Não ta conectado')
  else
    //ShowMessage('Agora ta ')
end;

procedure TfrmPrincipal.PRODUTOS1Click(Sender: TObject);
begin
  frmCadProduto:=TfrmCadProduto.Create(Self);
  frmCadProduto.ShowModal;
  frmCadProduto.Release;
end;

procedure TfrmPrincipal.SAIR1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
