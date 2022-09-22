inherited frmCadCategoria: TfrmCadCategoria
  Caption = 'Cadastro de Categoria'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    inherited tabListagem: TTabSheet
      inherited grdListagem: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'categoriaId'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Width = 352
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      object edtCategoriaId: TLabeledEdit
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
      object edtDescricao: TLabeledEdit
        Tag = 2
        Left = 16
        Top = 96
        Width = 433
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 30
        TabOrder = 1
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
      'SELECT * '
      #9'FROM categoria'
      #9'order by categoriaId')
    object QryListagemcategoriaId: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoriaId'
      ReadOnly = True
    end
    object QryListagemdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
  end
end
