unit uTelaHeranca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, ComCtrls, ExtCtrls, uDTMConexao,
  DB, ADODB, uEnum;

type
  TfrmFormHeranca = class(TForm)
    pgcPrincipal: TPageControl;
    pnlRodape: TPanel;
    tabListagem: TTabSheet;
    tabManutencao: TTabSheet;
    mskPesquisar: TMaskEdit;
    pnlListagemTopo: TPanel;
    grdListagem: TDBGrid;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnApagar: TBitBtn;
    btnNavigator: TDBNavigator;
    btnFechar: TBitBtn;
    QryListagem: TADOQuery;
    dtsListagem: TDataSource;
    lblIndice: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdListagemTitleClick(Column: TColumn);
    procedure mskPesquisarChange(Sender: TObject);

  private
    { Private declarations }
    EstadoDoCadastro:TEstadoDoCadastro;
    procedure ControlarBotoes(btnNovo, btnAlterar, btnCancelar,
          btnGravar, btnApagar: TBitBtn; Navegador: TDBNavigator;
          pgcPrincipal: TPageControl; Flag: Boolean);
    procedure ControlarIndiceTab(pgcPrincipal: TPageControl; Indice: Integer);
    function RetornarCampoTraduzido(Campo: string): string;
    procedure ExibirLabelIndice(Campo: string; aLabel: TLabel);
  public
    { Public declarations }
    IndiceAtual:string;
    function Apagar:Boolean; virtual;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean; virtual;
  end;

var
  frmFormHeranca: TfrmFormHeranca;

implementation

{$R *.dfm}
{$REGION 'Controle de Botoões'}
procedure TfrmFormHeranca.ControlarBotoes(btnNovo, btnAlterar, btnCancelar,
          btnGravar, btnApagar: TBitBtn; Navegador: TDBNavigator;
          pgcPrincipal: TPageControl; Flag: Boolean);

begin
  btnNovo.Enabled := Flag;
  btnApagar.Enabled := Flag;
  btnAlterar.Enabled := Flag;
  Navegador.Enabled := Flag;
  pgcPrincipal.Pages[0].TabVisible := Flag;
  btnCancelar.Enabled := not(Flag);
  btnGravar.Enabled := not(Flag);
end;

procedure TfrmFormHeranca.ControlarIndiceTab(pgcPrincipal: TPageControl; Indice:Integer);
begin
  if (pgcPrincipal.Pages[Indice].TabVisible) then
      pgcPrincipal.TabIndex:=Indice;
end;

procedure TfrmFormHeranca.btnNovoClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
    btnNavigator, pgcPrincipal, false);
    EstadoDoCadastro:=ecInserir;
end;

procedure TfrmFormHeranca.btnAlterarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
    btnNavigator, pgcPrincipal, False);
    EstadoDoCadastro:=ecAlterar;
end;

procedure TfrmFormHeranca.btnApagarClick(Sender: TObject);
begin
  if Apagar then begin
    ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
    btnNavigator, pgcPrincipal, False);
    ControlarIndiceTab(pgcPrincipal, 0);
    EstadoDoCadastro:=ecNenhum;
  end;
end;

procedure TfrmFormHeranca.btnCancelarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
    btnNavigator, pgcPrincipal, True);
    ControlarIndiceTab(pgcPrincipal, 0);
    EstadoDoCadastro:=ecNenhum;
end;

procedure TfrmFormHeranca.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFormHeranca.btnGravarClick(Sender: TObject);
begin
  try
    if Gravar(EstadoDoCadastro) then
      begin
        ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
        btnNavigator, pgcPrincipal, True);
        ControlarIndiceTab(pgcPrincipal, 0);
      end;
      finally
      EstadoDoCadastro:=ecNenhum;
      end;
end;

function TfrmFormHeranca.RetornarCampoTraduzido(Campo:string):string;
var i : integer;
begin
  for i := 0 to QryListagem.Fields.Count-1 do
    begin
    if LowerCase(QryListagem.Fields[i].FieldName)=LowerCase(Campo) then
      begin
        Result:=QryListagem.Fields[i].DisplayLabel;
        Break;
      end;
    end;
end;



procedure TfrmFormHeranca.ExibirLabelIndice(Campo:string ; aLabel:TLabel);
begin
  aLabel.Caption:=RetornarCampoTraduzido(Campo);
end;

{$ENDREGION}

{$REGION 'Metodo Virtual'}
function TfrmFormHeranca.Apagar: Boolean;
begin
  ShowMessage('deletado');
  Result := True;
end;

function TfrmFormHeranca.Gravar(EstadoDoCadastro:TEstadoDoCadastro): Boolean;
begin
   if (EstadoDoCadastro = ecInserir) then
    ShowMessage('Inserir')
  else if (EstadoDoCadastro = ecAlterar) then
    ShowMessage('Gravado');
  Result := True;
end;

{$ENDREGION}
procedure TfrmFormHeranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QryListagem.Close;
end;

procedure TfrmFormHeranca.FormCreate(Sender: TObject);
begin
  QryListagem.Connection:=dtmPrincipal.ConexaoDB;
  dtsListagem.DataSet:=QryListagem;
  grdListagem.DataSource:=dtsListagem;
  grdListagem.Options:=[dgTitles,dgIndicator,dgColumnResize,dgColLines,
  dgRowLines, dgTabs,dgRowSelect,dgAlwaysShowSelection,dgCancelOnExit,
  dgTitleClick,dgTitleHotTrack];
end;

procedure TfrmFormHeranca.FormShow(Sender: TObject);
begin
  if QryListagem.SQL.Text<>EmptyStr then begin
    QryListagem.IndexName:=IndiceAtual;
    ExibirLabelIndice(IndiceAtual, lblIndice);
    QryListagem.Open;
  end;
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
    btnNavigator, pgcPrincipal, True);
end;



procedure TfrmFormHeranca.grdListagemTitleClick(Column: TColumn);
begin
  IndiceAtual := Column.FieldName;
  ExibirLabelIndice(IndiceAtual, lblIndice);
end;

procedure TfrmFormHeranca.mskPesquisarChange(Sender: TObject);
begin
  QryListagem.Locate(IndiceAtual, TMaskEdit(Sender).Text, [loPartialKey]);
end;

end.
