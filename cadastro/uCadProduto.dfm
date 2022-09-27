inherited frmCadProduto: TfrmCadProduto
  Caption = 'Cadastro de Produto'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    inherited tabListagem: TTabSheet
      inherited grdListagem: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'produtoId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 376
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'valor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'categoriaId'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DescricaoCategoria'
            Visible = False
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 766
      ExplicitHeight = 360
      object lbl1: TLabel
        Left = 16
        Top = 141
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object lbl11: TLabel
        Left = 16
        Top = 277
        Width = 40
        Height = 13
        Caption = 'Valor R$'
      end
      object lblQuantidade: TLabel
        Left = 165
        Top = 277
        Width = 56
        Height = 26
        Caption = 'Quantidade'#13#10
      end
      object lblCategoria: TLabel
        Left = 504
        Top = 77
        Width = 47
        Height = 13
        Caption = 'Categoria'
      end
      object edtProdutoId: TLabeledEdit
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
      object edtDescricao: TMemo
        Left = 16
        Top = 160
        Width = 733
        Height = 89
        Lines.Strings = (
          'edtDescricao')
        MaxLength = 255
        TabOrder = 3
      end
      object edtValor: TEdit
        Left = 16
        Top = 296
        Width = 121
        Height = 21
        TabOrder = 4
      end
      object edtQuantidade: TEdit
        Left = 165
        Top = 296
        Width = 121
        Height = 21
        TabOrder = 5
      end
      object lkpCategoria: TDBLookupComboBox
        Left = 504
        Top = 96
        Width = 245
        Height = 21
        KeyField = 'categoriaId'
        ListField = 'descricao'
        ListSource = dtsCategoria
        TabOrder = 2
      end
    end
  end
  inherited pnlRodape: TPanel
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited QryListagem: TADOQuery
    CursorType = ctStatic
    SQL.Strings = (
      'select  p.produtoId,'
      #9'      p.nome,'
      '        p.descricao,'
      '        p.valor,'
      '        p.quantidade,'
      '        p.categoriaId,'
      '        c.descricao As DescricaoCategoria'
      'from produtos as p'
      '  LEFT JOIN categoria as c on c.categoriaId = p.categoriaId')
    object QryListagemprodutoId: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoId'
      ReadOnly = True
    end
    object QryListagemnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object QryListagemdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 255
    end
    object QryListagemvalor: TFMTBCDField
      FieldName = 'valor'
      Precision = 18
      Size = 5
    end
    object QryListagemquantidade: TFMTBCDField
      FieldName = 'quantidade'
      Precision = 18
      Size = 5
    end
    object QryListagemcategoriaId: TIntegerField
      FieldName = 'categoriaId'
    end
    object QryListagemDescricaoCategoria: TStringField
      FieldName = 'DescricaoCategoria'
      Size = 30
    end
  end
  object QryCategoria: TADOQuery
    Connection = dtmPrincipal.ConexaoDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select categoriaId, descricao from categoria')
    Left = 544
    Top = 144
    object QryCategoriacategoriaId: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoriaId'
      ReadOnly = True
    end
    object QryCategoriadescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
  end
  object dtsCategoria: TDataSource
    DataSet = QryCategoria
    Left = 616
    Top = 144
  end
end
