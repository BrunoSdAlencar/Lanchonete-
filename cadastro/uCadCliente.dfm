inherited frmCadCliente: TfrmCadCliente
  Caption = 'Cadastro de Clientes'
  ClientWidth = 933
  ExplicitWidth = 949
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 933
    inherited tabListagem: TTabSheet
      inherited pnlListagemTopo: TPanel
        Width = 925
      end
      inherited grdListagem: TDBGrid
        Width = 925
        Columns = <
          item
            Expanded = False
            FieldName = 'C'#243'digo'
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Endereco'
            Width = 336
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Bairro'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CEP'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Telefone'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'E-mail'
            Visible = False
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 852
      ExplicitHeight = 0
    end
  end
  inherited pnlRodape: TPanel
    Width = 933
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
    inherited btnFechar: TBitBtn
      Left = 837
    end
  end
  inherited QryListagem: TADOQuery
    CursorType = ctStatic
    SQL.Strings = (
      'select clienteId,'
      #9'nome,'
      #9'endereco,'
      #9'bairro,'
      #9'cep,'
      #9'telefone,'
      #9'email'
      'from clientes')
    object QryListagemclienteId: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'clienteId'
      ReadOnly = True
    end
    object QryListagemnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object QryListagemendereco: TStringField
      DisplayLabel = 'Endereco'
      FieldName = 'endereco'
      Size = 60
    end
    object QryListagembairro: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Size = 40
    end
    object QryListagemcep: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'cep'
      Size = 10
    end
    object QryListagemtelefone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefone'
      Size = 14
    end
    object QryListagememail: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'email'
      Size = 100
    end
  end
end
