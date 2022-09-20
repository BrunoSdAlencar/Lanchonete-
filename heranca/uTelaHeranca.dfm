object frmFormHeranca: TfrmFormHeranca
  Left = 0
  Top = 0
  Caption = 'Informe o titulo'
  ClientHeight = 429
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 774
    Height = 388
    ActivePage = tabListagem
    Align = alClient
    TabOrder = 0
    object tabListagem: TTabSheet
      Caption = 'Listagem'
      object pnlListagemTopo: TPanel
        Left = 0
        Top = 0
        Width = 766
        Height = 73
        Align = alTop
        TabOrder = 0
        object lblIndice: TLabel
          Left = 3
          Top = 2
          Width = 78
          Height = 13
          Caption = 'Campo Pesquisa'
        end
        object mskPesquisar: TMaskEdit
          Left = 3
          Top = 21
          Width = 233
          Height = 21
          TabOrder = 0
          TextHint = 'Pesquisa'
          OnChange = mskPesquisarChange
        end
      end
      object grdListagem: TDBGrid
        Left = 0
        Top = 73
        Width = 766
        Height = 287
        Align = alClient
        DataSource = dtsListagem
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnTitleClick = grdListagemTitleClick
      end
    end
    object tabManutencao: TTabSheet
      Caption = 'Manuten'#231#227'o'
      ImageIndex = 1
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 388
    Width = 774
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      774
      41)
    object btnNovo: TBitBtn
      Left = 7
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Novo'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnAlterar: TBitBtn
      Left = 88
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Alterar'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnCancelar: TBitBtn
      Left = 169
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    object btnGravar: TBitBtn
      Left = 250
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Gravar'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 3
      OnClick = btnGravarClick
    end
    object btnApagar: TBitBtn
      Left = 331
      Top = 6
      Width = 75
      Height = 25
      Caption = 'A&pagar'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 4
      OnClick = btnApagarClick
    end
    object btnNavigator: TDBNavigator
      Left = 412
      Top = 6
      Width = 224
      Height = 25
      DataSource = dtsListagem
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 5
    end
    object btnFechar: TBitBtn
      Left = 678
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight]
      Caption = '&Fechar'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 6
      OnClick = btnFecharClick
    end
  end
  object QryListagem: TADOQuery
    Connection = dtmPrincipal.ConexaoDB
    Parameters = <>
    Left = 496
    Top = 40
  end
  object dtsListagem: TDataSource
    DataSet = QryListagem
    Left = 568
    Top = 40
  end
end
