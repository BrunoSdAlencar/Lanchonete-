object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mainPrincipal
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mainPrincipal: TMainMenu
    Left = 560
    Top = 40
    object CADASTRO1: TMenuItem
      Caption = 'CADASTRO'
      object CLIENTES1: TMenuItem
        Caption = 'CLIENTES'
        OnClick = CLIENTES1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object PRODUTOS1: TMenuItem
        Caption = 'PRODUTOS'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object USUARIO1: TMenuItem
        Caption = 'USUARIO'
      end
      object ALTERARSENHA1: TMenuItem
        Caption = 'ALTERAR SENHA'
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object SAIR1: TMenuItem
        Caption = 'SAIR'
        OnClick = SAIR1Click
      end
    end
    object MOVIMENTAO1: TMenuItem
      Caption = 'MOVIMENTA'#199#195'O'
      object VENDAS1: TMenuItem
        Caption = 'VENDAS'
      end
    end
    object RELATORIOS1: TMenuItem
      Caption = 'RELATORIOS'
    end
  end
end
