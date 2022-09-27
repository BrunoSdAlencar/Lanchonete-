inherited frmCadCliente: TfrmCadCliente
  Caption = 'Cadastro de Clientes'
  ClientWidth = 933
  ExplicitWidth = 949
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 933
    ActivePage = tabManutencao
    ExplicitWidth = 933
    inherited tabListagem: TTabSheet
      ExplicitWidth = 925
      inherited pnlListagemTopo: TPanel
        Width = 925
        ExplicitWidth = 925
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
            FieldName = 'E-mail'
            Visible = False
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitWidth = 925
      object lbl: TLabel
        Left = 672
        Top = 77
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object lbl1: TLabel
        Left = 16
        Top = 130
        Width = 45
        Height = 13
        Caption = 'Endereco'
        FocusControl = edtEndereco
      end
      object lbl2: TLabel
        Left = 672
        Top = 130
        Width = 28
        Height = 13
        Caption = 'Bairro'
        FocusControl = edtBairro
      end
      object lbl3: TLabel
        Left = 16
        Top = 194
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object lbl4: TLabel
        Left = 16
        Top = 256
        Width = 28
        Height = 13
        Caption = 'E-mail'
        FocusControl = edtEmail
      end
      object edtClienteId: TLabeledEdit
        Tag = 1
        Left = 16
        Top = 32
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        HideSelection = False
        MaxLength = 10
        TabOrder = 0
      end
      object edtNome: TLabeledEdit
        Tag = 2
        Left = 16
        Top = 96
        Width = 433
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        MaxLength = 30
        TabOrder = 1
      end
      object edtEndereco: TDBEdit
        Left = 16
        Top = 149
        Width = 638
        Height = 21
        DataField = 'endereco'
        DataSource = dtsListagem
        TabOrder = 3
      end
      object edtBairro: TDBEdit
        Left = 672
        Top = 149
        Width = 194
        Height = 21
        DataField = 'bairro'
        DataSource = dtsListagem
        TabOrder = 4
      end
      object edtEmail: TDBEdit
        Left = 16
        Top = 275
        Width = 353
        Height = 21
        DataField = 'email'
        DataSource = dtsListagem
        TabOrder = 6
      end
      object mskeditCep: TMaskEdit
        Left = 672
        Top = 96
        Width = 116
        Height = 21
        EditMask = '00000\-999;1;_'
        MaxLength = 9
        TabOrder = 2
        Text = '     -   '
      end
      object mskeditTelefone: TMaskEdit
        Left = 16
        Top = 213
        Width = 119
        Height = 21
        EditMask = '!\(99\)00000-0000;1;_'
        MaxLength = 14
        TabOrder = 5
        Text = '(  )     -    '
      end
    end
  end
  inherited pnlRodape: TPanel
    Width = 933
    ExplicitWidth = 933
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
    inherited btnFechar: TBitBtn
      Left = 837
      ExplicitLeft = 837
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
