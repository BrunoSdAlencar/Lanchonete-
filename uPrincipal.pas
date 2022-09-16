unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, uDTMConexao;

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
    procedure SAIR1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CLIENTES1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uCadCliente;

{$R *.dfm}

procedure TfrmPrincipal.CLIENTES1Click(Sender: TObject);
begin
  frmCadCliente:=TfrmCadCliente.Create(Self);
  frmCadCliente.ShowModal;
  frmCadCliente.Release;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  dtmPrincipal := TdtmPrincipal.Create(Self);
  if not dtmPrincipal.ConexaoDB.Connected then
    //ShowMessage('Não ta conectado')
  else
    //ShowMessage('Agora ta ')
end;

procedure TfrmPrincipal.SAIR1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
