program Lanchonete;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDTMConexao in 'datamodule\uDTMConexao.pas' {dtmPrincipal: TDataModule},
  uTelaHeranca in 'heranca\uTelaHeranca.pas' {frmFormHeranca},
  uCadCliente in 'cadastro\uCadCliente.pas' {frmCadCliente},
  uEnum in 'heranca\uEnum.pas',
  uCadCategoria in 'cadastro\uCadCategoria.pas' {frmCadCategoria};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadCategoria, frmCadCategoria);
  Application.Run;
end.
