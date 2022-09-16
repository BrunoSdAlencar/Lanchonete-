unit uDTMConexao;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdtmPrincipal = class(TDataModule)
    ConexaoDB: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmPrincipal: TdtmPrincipal;

implementation

{$R *.dfm}

end.
