unit uTelaHeranca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, ComCtrls, ExtCtrls, uDTMConexao,
  DB, ADODB;

type
  TfrmFormHeranca = class(TForm)
    pgcPrincipal: TPageControl;
    pnlRodape: TPanel;
    tabListagem: TTabSheet;
    tabManutencao: TTabSheet;
    mskPesquisar: TMaskEdit;
    btnPesquisar: TBitBtn;
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
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFormHeranca: TfrmFormHeranca;

implementation

{$R *.dfm}

procedure TfrmFormHeranca.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFormHeranca.FormCreate(Sender: TObject);
begin
  QryListagem.Connection:=dtmPrincipal.ConexaoDB;
  dtsListagem.DataSet:=QryListagem;
  grdListagem.DataSource:=dtsListagem;
end;

end.
