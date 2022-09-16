inherited frmCadCliente: TfrmCadCliente
  Caption = 'Cadastro de Clientes'
  ClientWidth = 860
  ExplicitWidth = 876
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 860
    ExplicitWidth = 774
    inherited tabListagem: TTabSheet
      ExplicitWidth = 766
      inherited pnlListagemTopo: TPanel
        Width = 852
        ExplicitWidth = 766
      end
      inherited grdListagem: TDBGrid
        Width = 852
        Columns = <
          item
            Expanded = False
            FieldName = 'clientesId'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'endereco'
            Width = 336
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'bairro'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'cep'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'telefone'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'email'
            Visible = False
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitWidth = 766
    end
  end
  inherited pnlRodape: TPanel
    Width = 860
    ExplicitWidth = 774
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
    inherited btnFechar: TBitBtn
      Left = 764
      ExplicitLeft = 678
    end
  end
  inherited QryListagem: TADOQuery
    CursorType = ctStatic
    SQL.Strings = (
      'select clientesId,'
      #9'nome,'
      #9'endereco,'
      #9'bairro,'
      #9'cep,'
      #9'telefone,'
      #9'email'
      'from clientes')
    object QryListagemclientesId: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'clientesId'
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
    object QryListagemtelefone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefone'
      Size = 14
    end
  end
end
