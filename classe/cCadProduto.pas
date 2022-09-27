unit cCadProduto;

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
  Tproduto=class
  private
    ConexaoDB:TADOConnection;
    F_produtoId:Integer;
    F_nome:string;
    F_descricao:string;
    F_valor:Double;
    F_quantidade:Double;
    F_categoriaId:Integer;

  public
    constructor Create(aConexao: TADOConnection);
    destructor Destroy; override;
    function Inserir:Boolean;
    function Atualizar:Boolean;
    function Apagar:Boolean;
    function Selecionar(id:Integer):Boolean;

  published
    property codigo      :Integer      read F_produtoId      write F_produtoId;
    property nome        :string       read F_nome           write F_nome;
    property descricao   :string       read F_descricao      write F_descricao;
    property valor       :double       read F_valor          write F_valor;
    property quantidade  :double       read F_quantidade     write F_quantidade;
    property categoriaId :Integer      read F_categoriaId    write F_categoriaId;



  end;


implementation

{$region 'Constructor and Destructor'}
constructor TProduto.Create(aConexao: TADOConnection);
  begin
    ConexaoDB:=aConexao;
  end;

destructor TProduto.Destroy;
  begin
    inherited
  end;

{$endregion}

{$REGION 'CRUD'}

function Tproduto.Apagar: Boolean;
var Qry:TADOQuery;
begin
    if MessageDlg('Apagar o Registro: '+#13+#13+
                  'Código: '+IntToStr(F_produtoId)+#13+
                  'Descrição: '+F_nome,mtConfirmation,[mbYes, mbNo],0)=mrNo then begin
       Result:=false;
       abort;
    end;

    try
      Result:=true;
      Qry:=TADOQuery.Create(nil);
      Qry.Connection:=ConexaoDB;
      Qry.SQL.Clear;
      Qry.SQL.Add('DELETE FROM produtos '+
                  ' WHERE produtoId=:produtoId ');
      Qry.Parameters.ParamByName('produtoId').value :=F_produtoId;
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



function Tproduto.Atualizar: Boolean;
var Qry:TADOQuery;
begin
  try
    Result:=true;
    Qry:=TADOQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE produtos '+
                '   SET nome           =:nome '+
                '       ,descricao     =:descricao '+
                '       ,valor         =:valor '+
                '       ,quantidade    =:quantidade '+
                '       ,categoriaId   =:categoriaId '+
                ' WHERE produtoId=:produtoId ');
    Qry.Parameters.ParamByName('produtoId').value       :=Self.F_produtoId;
    Qry.Parameters.ParamByName('nome').value             :=Self.F_nome;
    Qry.Parameters.ParamByName('descricao').value        :=Self.F_descricao;
    Qry.Parameters.ParamByName('valor').value             :=Self.F_valor;
    Qry.Parameters.ParamByName('quantidade').value        :=Self.F_quantidade;
    Qry.Parameters.ParamByName('categoriaId').value     :=Self.F_categoriaId;

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

function Tproduto.Inserir: Boolean;
var Qry:TADOQuery;
begin
  try
    Result:=true;
    Qry:=TADOQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO produtos (nome, '+
                '                      descricao, '+
                '                      valor,  '+
                '                      quantidade,  '+
                '                      categoriaId) '+
                ' VALUES              (:nome, '+
                '                      :descricao, '+
                '                      :valor,  '+
                '                      :quantidade,  '+
                '                      :categoriaId )' );

    Qry.Parameters.ParamByName('nome').value             :=Self.F_nome;
    Qry.Parameters.ParamByName('descricao').value        :=Self.F_descricao;
    Qry.Parameters.ParamByName('valor').value             :=Self.F_valor;
    Qry.Parameters.ParamByName('quantidade').value        :=Self.F_quantidade;
    Qry.Parameters.ParamByName('categoriaId').value     :=Self.F_categoriaId;

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

function Tproduto.Selecionar(id: Integer): Boolean;
var Qry:TADOQuery;
begin
try
    Result:=true;
    Qry:=TADOQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT produtoId,'+
                '       nome, '+
                '       descricao, '+
                '       valor, '+
                '       quantidade, '+
                '       categoriaId '+
                '  FROM produtos '+
                ' WHERE produtoId=:produtoId');
    Qry.Parameters.ParamByName('produtoId').value:=id;
    Try
      Qry.Open;

      Self.F_produtoId     := Qry.FieldByName('produtoId').AsInteger;
      Self.F_nome          := Qry.FieldByName('nome').AsString;
      Self.F_descricao     := Qry.FieldByName('descricao').AsString;
      Self.F_valor         := Qry.FieldByName('valor').AsFloat;
      Self.F_quantidade    := Qry.FieldByName('quantidade').AsFloat;
      Self.F_categoriaId   := Qry.FieldByName('categoriaId').AsInteger;
    Except
      Result:=false;
    End;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;
{$ENDREGION}



end.
