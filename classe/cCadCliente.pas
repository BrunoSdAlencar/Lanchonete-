unit cCadCliente;

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
  TCliente = class
    private
      ConexaoDB:TADOConnection;
      F_clienteId:Integer;
      F_nome:String;
      F_cep:string;
      F_endereco:string;
      F_bairro:string;
      F_telefone:string;
      F_email:string;

    public
      constructor Create(aConexao:TADOConnection);
      destructor Destroy; override;

      function Inserir:Boolean;
      function Atualizar:Boolean;
      function Apagar:Boolean;
      function Selecionar(id:Integer):Boolean;
    published
       property codigo        :Integer    read F_clienteId      write F_clienteId;
       property nome          :string     read F_nome           write F_nome;
       property endereco      :string     read F_endereco       write F_endereco;
       property bairro        :string     read F_bairro         write F_bairro;
       property cep           :string     read F_cep            write F_Cep;
       property telefone      :string     read F_telefone       write F_telefone;
       property email         :string     read F_email          write F_email;
  end;
implementation

{ TCliente }



{$region 'Constructor and Destructor'}
constructor TCliente.Create(aConexao:TADOConnection);
begin
  ConexaoDB:=aConexao;
end;

destructor TCliente.Destroy;
begin

  inherited;
end;
{$endRegion}

{$region 'CRUD'}
function TCliente.Apagar: Boolean;
var Qry:TADOQuery;
begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
                'Código: '+IntToStr(F_clienteId)+#13+
                'Descrição: '+F_nome,mtConfirmation,[mbYes, mbNo],0)=mrNo then begin
     Result:=false;
     abort;
  end;

  try
    Result:=true;
    Qry:=TADOQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('DELETE FROM clientes '+
                ' WHERE clienteId=:clienteId ');
    Qry.Parameters.ParamByName('clienteId').Value :=F_clienteId;
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

function TCliente.Atualizar: Boolean;
var Qry:TADOQuery;
begin
  begin
    try
      Result:=true;
      Qry:=TADOQuery.Create(nil);
      Qry.Connection:=ConexaoDB;
      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE clientes '+
                  '   SET nome            =:nome '+
                  '       ,endereco       =:endereco '+
                  '       ,bairro         =:bairro '+
                  '       ,cep            =:cep '+
                  '       ,telefone       =:telefone '+
                  '       ,email          =:email '+
                  ' WHERE clienteId=:clienteId ');
      Qry.Parameters.ParamByName('clienteId').value        :=Self.F_clienteId;
      Qry.Parameters.ParamByName('nome').value             :=Self.F_nome;
      Qry.Parameters.ParamByName('endereco').value         :=Self.F_endereco;
      Qry.Parameters.ParamByName('bairro').value           :=Self.F_bairro;
      Qry.Parameters.ParamByName('cep').value              :=Self.F_cep;
      Qry.Parameters.ParamByName('telefone').value         :=Self.F_telefone;
      Qry.Parameters.ParamByName('email').value            :=Self.F_email;



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
end;

function TCliente.Inserir: Boolean;
var Qry:TADOQuery;
begin
  try
    Result:=true;
    Qry:=TADOQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO clientes (nome, '+
                '                      endereco, '+
                '                      bairro, '+
                '                      cep, '+
                '                      telefone, '+
                '                      email) '+
                ' VALUES              (:nome, '+
                '                      :endereco, '+
                '                      :bairro,  '+
                '                      :cep, '+
                '                      :telefone, '+
                '                      :email)' );

    Qry.Parameters.ParamByName('nome').value             :=Self.F_nome;
    Qry.Parameters.ParamByName('endereco').value         :=Self.F_endereco;
    Qry.Parameters.ParamByName('bairro').value           :=Self.F_bairro;
    Qry.Parameters.ParamByName('cep').value              :=Self.F_cep;
    Qry.Parameters.ParamByName('telefone').value         :=Self.F_telefone;
    Qry.Parameters.ParamByName('email').value            :=Self.F_email;

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

function TCliente.Selecionar(id: Integer): Boolean;
var Qry:TADOQuery;
begin
  try
    Result:=true;
    Qry:=TADOQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT clienteId,'+
                '       nome, '+
                '       endereco, '+
                '       bairro, '+
                '       cep, '+
                '       telefone, '+
                '       email '+
                '  FROM clientes '+
                ' WHERE clienteId=:clienteId');
    Qry.Parameters.ParamByName('clienteId').value:=id;
    Try
      Qry.Open;

      Self.F_clienteId     := Qry.FieldByName('clienteId').AsInteger;
      Self.F_nome          := Qry.FieldByName('nome').AsString;
      Self.F_endereco      := Qry.FieldByName('endereco').AsString;
      Self.F_bairro        := Qry.FieldByName('bairro').AsString;
      Self.F_cep           := Qry.FieldByName('cep').AsString;
      Self.F_telefone      := Qry.FieldByName('telefone').AsString;
      Self.F_email         := Qry.FieldByName('email').AsString;
    except
      Result:=false;
    End;
    finally
    if Assigned(Qry) then
      FreeAndNil(Qry);
  End;
end;
{$endRegion}


end.
