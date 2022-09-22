unit cCadCategoria;

interface
   uses  Classes,
         Windows,
         SysUtils,
         DB,
         ADODB,
         Controls,
         ExtCtrls,
         Dialogs;

type
  TCategoria = class

  private
    ConexaoDB:TADOConnection;
    F_categoriaId:Integer;  //Int
    F_descricao:String;

    function GetCodigo: Integer;
    function getDescricao: string;

    procedure SetCodigo(const Value: Integer);
    procedure setDescricao(const Value: string); //VarChar

  public
    constructor Create(aConexao:TADOConnection);
    destructor Destroy; override;

    function Inserir:Boolean;
    function Atualizar:Boolean;
    function Apagar:Boolean;
    function Selecionar(id:Integer):Boolean;

  published
     property codigo:Integer   read GetCodigo write SetCodigo;
     property descricao:string read getDescricao write setDescricao;


end;


implementation

{ TCategoria }

{$region 'Crud'}

function TCategoria.Apagar: Boolean;
var Qry:TADOQuery;
  begin
    if MessageDlg('Apagar o Registro: '+#13+#13+
                'Código: '+IntToStr(F_categoriaId)+#13+
                'Descrição: '+F_descricao,mtConfirmation,[mbYes, mbNo],0)=mrNo then begin
     Result:=false;
     abort;
  end;

  try
    Result:=true;
    Qry:=TADOQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('DELETE FROM categoria '+
                ' WHERE categoriaId=:categoriaId ');
    Qry.Parameters.ParamByName('categoriaId').Value :=F_categoriaId;
    Try
      Qry.ExecSQL;
    Except
      Result:=false;
    End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
  end;

function TCategoria.Atualizar: Boolean;
var Qry:TADOQuery;
  begin
    try
      Result:=true;
      Qry:=TADOQuery.Create(nil);
      Qry.Connection:=ConexaoDB;
      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE categoria '+
                  '   SET descricao=:descricao '+
                  ' WHERE categoriaId=:categoriaId ');
      Qry.Parameters.ParamByName('categoriaId').Value :=Self.F_categoriaId;
      Qry.Parameters.ParamByName('descricao').Value    :=Self.F_descricao;

    Try
      Qry.ExecSQL;
    Except
      Result:=false;
    End;
  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
  end;


function TCategoria.Inserir: Boolean;
var Qry:TADOQuery;
  begin
    try
      Qry:=TADOQuery.Create(nil);
      Qry.Connection:=ConexaoDB;
      Qry.SQL.Clear;
      Qry.SQL.Add('INSERT INTO categoria (descricao) values (:descricao)');
      Qry.Parameters.ParamByName('descricao').Value:=Self.F_descricao;
      try
        Qry.ExecSQL;
      except
        Result:=False;
      end;
    finally
      if Assigned(Qry) then
        FreeAndNil(Qry);
    end;
  end;

function TCategoria.Selecionar(id: Integer): Boolean;
var Qry:TADOQuery;
  begin
    try
      Result:=true;
      Qry:=TADOQuery.Create(nil);
      Qry.Connection:=ConexaoDB;
      Qry.SQL.Clear;
      Qry.SQL.Add('SELECT categoriaId, '+
                  '       descricao '+
                  '  FROM categoria '+
                  ' WHERE categoriaId=:categoriaId');
      Qry.Parameters.ParamByName('categoriaId').Value:=id;
        Try
          Qry.Open;

          Self.F_categoriaId := Qry.FieldByName('categoriaId').AsInteger;
          Self.F_descricao   := Qry.FieldByName('descricao').AsString;
        Except
          Result:=false;
        End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
  end;

{$ENDREGION}

{$REGION 'Constructor & Destructor'}
constructor TCategoria.Create(aConexao:TADOConnection);
  begin
    ConexaoDB:=aConexao;
  end;

destructor TCategoria.Destroy;
  begin
    inherited;
  end;

{$ENDREGION}

{$region 'Get'}
function TCategoria.GetCodigo: Integer;
begin
  Result := Self.F_categoriaId;
end;

function TCategoria.getDescricao: string;
begin
  Result := Self.F_descricao;
end;


{$ENDREGION}

{$region 'Set'}

procedure TCategoria.SetCodigo(const Value: Integer);
begin
  Self.F_categoriaId := Value;
end;

procedure TCategoria.setDescricao(const Value: string);
begin
  Self.F_descricao := Value;
end;
{$ENDREGION}

end.
