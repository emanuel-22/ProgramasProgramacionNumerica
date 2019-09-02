object FormMainFunciones: TFormMainFunciones
  Left = 1032
  Top = 135
  Width = 809
  Height = 836
  Caption = 'Funciones TP2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PanelMetBiseccion: TPanel
    Left = 0
    Top = 0
    Width = 793
    Height = 777
    BevelInner = bvRaised
    BorderStyle = bsSingle
    TabOrder = 0
    Visible = False
    object LabelFuncion: TLabel
      Left = 32
      Top = 51
      Width = 127
      Height = 13
      Caption = 'Ingrese la Funci'#243'n:  f(x) ='
    end
    object Graficador1: TGraficador
      Left = 32
      Top = 80
      Width = 521
      Height = 385
      minX = -2.000000000000000000
      minY = -2.000000000000000000
      maxX = 2.000000000000000000
      maxY = 2.000000000000000000
      step = 0.002000000000000000
    end
    object LabelTitle: TLabel
      Left = 32
      Top = 16
      Width = 194
      Height = 19
      Caption = 'M'#201'TODO DE BISECCI'#211'N'
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object LabelActGraficador: TLabel
      Left = 568
      Top = 136
      Width = 137
      Height = 16
      Caption = 'Actualizar Graficador'
      Color = clActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object LabeMaxX: TLabel
      Left = 568
      Top = 168
      Width = 43
      Height = 13
      Caption = 'M'#225'x X = '
    end
    object LabelMaxY: TLabel
      Left = 568
      Top = 192
      Width = 43
      Height = 13
      Caption = 'M'#225'x Y = '
    end
    object LabelMinX: TLabel
      Left = 568
      Top = 224
      Width = 39
      Height = 13
      Caption = 'Min X = '
    end
    object LabelMinY: TLabel
      Left = 568
      Top = 248
      Width = 39
      Height = 13
      Caption = 'Min Y = '
    end
    object EditFuncion: TEdit
      Left = 168
      Top = 48
      Width = 385
      Height = 21
      TabOrder = 0
    end
    object ButtonGraficarBis: TButton
      Left = 576
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Graficar'
      TabOrder = 1
      OnClick = ButtonGraficarBisClick
    end
    object ButtonZoomInBis: TButton
      Left = 568
      Top = 336
      Width = 75
      Height = 25
      Caption = 'Zoom (+)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = ButtonZoomInBisClick
    end
    object ButtonCancelarBis: TButton
      Left = 576
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 3
      OnClick = ButtonCancelarBisClick
    end
    object EditMaxX: TEdit
      Left = 616
      Top = 168
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object EditMaxY: TEdit
      Left = 616
      Top = 192
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object EditMinX: TEdit
      Left = 616
      Top = 224
      Width = 121
      Height = 21
      TabOrder = 6
    end
    object EditMinY: TEdit
      Left = 616
      Top = 248
      Width = 121
      Height = 21
      TabOrder = 7
    end
    object ButtonActualizarGraficadorBis: TButton
      Left = 600
      Top = 280
      Width = 113
      Height = 25
      Caption = 'Actualizar Datos'
      TabOrder = 8
      OnClick = ButtonActualizarGraficadorBisClick
    end
    object ButtonZoomOutBis: TButton
      Left = 568
      Top = 376
      Width = 75
      Height = 25
      Caption = 'Zoom (-)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = ButtonZoomOutBisClick
    end
    object PanelDatosRaiz: TPanel
      Left = 32
      Top = 472
      Width = 521
      Height = 113
      BorderStyle = bsSingle
      TabOrder = 10
      Visible = False
      object LabelTitleRaiz: TLabel
        Left = 8
        Top = 10
        Width = 175
        Height = 19
        Caption = 'CALCULO DE LA RA'#205'Z'
        Color = clMoneyGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object LabelIntervalo: TLabel
        Left = 8
        Top = 40
        Width = 156
        Height = 13
        Caption = 'Ingrese el Intervalo (inf,sup) =  '
      end
      object LabelError: TLabel
        Left = 8
        Top = 72
        Width = 89
        Height = 13
        Caption = 'Ingrese el Error = '
      end
      object LabelInfBiseccion: TLabel
        Left = 168
        Top = 40
        Width = 14
        Height = 13
        Caption = 'Inf'
      end
      object LabelSupBiseccion: TLabel
        Left = 248
        Top = 40
        Width = 18
        Height = 13
        Caption = 'Sup'
      end
      object EditInfBiseccion: TEdit
        Left = 193
        Top = 35
        Width = 41
        Height = 21
        TabOrder = 0
      end
      object EditError: TEdit
        Left = 104
        Top = 67
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object ButtonCalRaizBis: TButton
        Left = 392
        Top = 24
        Width = 89
        Height = 25
        Caption = 'Calcular Raiz'
        TabOrder = 2
        OnClick = ButtonCalRaizBisClick
      end
      object ButtonLimpiarBis: TButton
        Left = 392
        Top = 56
        Width = 89
        Height = 25
        Caption = 'Limpiar'
        TabOrder = 3
      end
      object EditSupBiseccion: TEdit
        Left = 272
        Top = 35
        Width = 41
        Height = 21
        TabOrder = 4
      end
    end
    object PanelMuestraResult: TPanel
      Left = 32
      Top = 592
      Width = 521
      Height = 169
      BorderStyle = bsSingle
      TabOrder = 11
      object LabelMuestraResult: TLabel
        Left = 8
        Top = 10
        Width = 110
        Height = 19
        Caption = 'RESULTADOS'
        Color = clMoneyGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object LabelShowIntervalo: TLabel
        Left = 8
        Top = 48
        Width = 58
        Height = 13
        Caption = 'Intervalo = '
      end
      object LabelShowRaiz: TLabel
        Left = 8
        Top = 72
        Width = 94
        Height = 13
        Caption = 'Ra'#237'z Aproximada = '
      end
      object LabelDerivada: TLabel
        Left = 8
        Top = 120
        Width = 38
        Height = 13
        Caption = 'f'#180'(x) = '
      end
      object LabelShowDerivada: TLabel
        Left = 51
        Top = 120
        Width = 3
        Height = 13
      end
      object LabelCantIter: TLabel
        Left = 8
        Top = 96
        Width = 129
        Height = 13
        Caption = 'Cantidad de Iteraciones = '
      end
      object LabelShowCantIter: TLabel
        Left = 144
        Top = 96
        Width = 3
        Height = 13
      end
      object LabelFuncEval: TLabel
        Left = 8
        Top = 144
        Width = 109
        Height = 13
        Caption = 'Evaludo en el Punto = '
      end
      object LabelShowPtoEval: TLabel
        Left = 120
        Top = 144
        Width = 28
        Height = 13
        Caption = 'Punto'
      end
      object ButtonEvaluarPto: TButton
        Left = 408
        Top = 128
        Width = 75
        Height = 25
        Caption = 'Evaluar'
        TabOrder = 0
        OnClick = ButtonEvaluarPtoClick
      end
      object EditFuncEval: TEdit
        Left = 280
        Top = 128
        Width = 121
        Height = 21
        TabOrder = 1
      end
    end
  end
  object MainMenu: TMainMenu
    Left = 832
    Top = 24
    object MenuArchivo: TMenuItem
      Caption = 'Archivo'
      object MenuItemBiseccion: TMenuItem
        Caption = 'M'#233'todo de Bisecci'#243'n'
        ShortCut = 16449
        OnClick = MenuItemBiseccionClick
      end
      object MenuItemSalir: TMenuItem
        Caption = 'Salir'
        ShortCut = 16465
        OnClick = MenuItemSalirClick
      end
    end
    object MenuAyuda: TMenuItem
      Caption = 'Ayuda'
    end
  end
end
