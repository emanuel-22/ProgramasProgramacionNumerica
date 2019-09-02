object FormMainFunciones: TFormMainFunciones
  Left = 476
  Top = 101
  Width = 806
  Height = 784
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
  object PanelMetNewton: TPanel
    Left = 0
    Top = 1
    Width = 785
    Height = 849
    BevelInner = bvRaised
    BorderStyle = bsSingle
    TabOrder = 1
    Visible = False
    object LabelIngFuncionNewton: TLabel
      Left = 32
      Top = 51
      Width = 127
      Height = 13
      Caption = 'Ingrese la Funci'#243'n:  f(x) ='
    end
    object LabelTitleNewton1: TLabel
      Left = 32
      Top = 16
      Width = 176
      Height = 19
      Caption = 'M'#201'TODO DE NEWTON'
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object LabelActGrafNewton: TLabel
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
    object LabelMaxXNewton: TLabel
      Left = 568
      Top = 168
      Width = 43
      Height = 13
      Caption = 'M'#225'x X = '
    end
    object LabelMaxYNewton: TLabel
      Left = 568
      Top = 192
      Width = 43
      Height = 13
      Caption = 'M'#225'x Y = '
    end
    object LabelMinXNewton: TLabel
      Left = 568
      Top = 224
      Width = 39
      Height = 13
      Caption = 'Min X = '
    end
    object LabelMinYNewton: TLabel
      Left = 568
      Top = 248
      Width = 39
      Height = 13
      Caption = 'Min Y = '
    end
    object GraficadorNewton: TGraficador
      Left = 40
      Top = 112
      Width = 497
      Height = 353
      minX = -3.000000000000000000
      minY = -3.000000000000000000
      maxX = 3.000000000000000000
      maxY = 3.000000000000000000
      step = 0.002000000000000000
    end
    object EditFuncionNewton: TEdit
      Left = 168
      Top = 48
      Width = 385
      Height = 21
      TabOrder = 0
      OnKeyPress = EditFuncionNewtonKeyPress
    end
    object ButtonGraficarFuncNewton: TButton
      Left = 576
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Graficar'
      TabOrder = 1
      OnClick = ButtonGraficarFuncNewtonClick
    end
    object ButtonZoomInNewton: TButton
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
      TabOrder = 8
      OnClick = ButtonZoomInNewtonClick
    end
    object ButtonCancelarNewton: TButton
      Left = 576
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = ButtonCancelarNewtonClick
    end
    object EditMaxXNewton: TEdit
      Left = 616
      Top = 168
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object EditMaxYNewton: TEdit
      Left = 616
      Top = 192
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object EditMinXNewton: TEdit
      Left = 616
      Top = 224
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object EditMinYNewton: TEdit
      Left = 616
      Top = 248
      Width = 121
      Height = 21
      TabOrder = 6
    end
    object ButtonActGrafNewton: TButton
      Left = 600
      Top = 280
      Width = 113
      Height = 25
      Caption = 'Actualizar Datos'
      TabOrder = 7
      OnClick = ButtonActGrafNewtonClick
    end
    object ButtonZoomOut: TButton
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
      OnClick = ButtonZoomOutClick
    end
    object PanelDatosRaizNewton: TPanel
      Left = 32
      Top = 504
      Width = 521
      Height = 113
      BorderStyle = bsSingle
      TabOrder = 10
      Visible = False
      object LabelTilteNewton2: TLabel
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
      object Label10: TLabel
        Left = 8
        Top = 48
        Width = 89
        Height = 13
        Caption = 'Ingrese el Error = '
      end
      object LabelRaizInicialNewton: TLabel
        Left = 8
        Top = 80
        Width = 143
        Height = 13
        Caption = 'Estimaci'#243'n Inicial de la Ra'#237'z = '
      end
      object EditErrorNewton: TEdit
        Left = 104
        Top = 43
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object ButtonCalRaizNewton: TButton
        Left = 392
        Top = 24
        Width = 89
        Height = 25
        Caption = 'Calcular Raiz'
        TabOrder = 1
        OnClick = ButtonCalRaizNewtonClick
      end
      object ButtonLimpiarNewton: TButton
        Left = 392
        Top = 56
        Width = 89
        Height = 25
        Caption = 'Limpiar'
        TabOrder = 2
        OnClick = ButtonLimpiarNewtonClick
      end
      object EditRaizInicialNewton: TEdit
        Left = 160
        Top = 75
        Width = 121
        Height = 21
        TabOrder = 3
      end
    end
    object PanelMuestraResultNewton: TPanel
      Left = 32
      Top = 640
      Width = 521
      Height = 161
      BorderStyle = bsSingle
      TabOrder = 11
      Visible = False
      object LabelTitleNewton3: TLabel
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
      object LabelRaizAproxNewton: TLabel
        Left = 8
        Top = 72
        Width = 94
        Height = 13
        Caption = 'Ra'#237'z Aproximada = '
      end
      object LabelDerivadaNewton: TLabel
        Left = 8
        Top = 120
        Width = 38
        Height = 13
        Caption = 'f'#180'(x) = '
      end
      object LabelShowDerivadaNewton: TLabel
        Left = 51
        Top = 120
        Width = 3
        Height = 13
      end
      object LabelCantIterNewton: TLabel
        Left = 8
        Top = 96
        Width = 129
        Height = 13
        Caption = 'Cantidad de Iteraciones = '
      end
      object LabelShowCantIterNewton: TLabel
        Left = 144
        Top = 96
        Width = 3
        Height = 13
      end
      object LabelShowEstimacionNewton: TLabel
        Left = 8
        Top = 48
        Width = 143
        Height = 13
        Caption = 'Estimaci'#243'n Inicial de la Raiz = '
      end
    end
  end
  object PanelMetRegFalsiMod: TPanel
    Left = 0
    Top = 0
    Width = 785
    Height = 850
    BevelInner = bvRaised
    BorderStyle = bsSingle
    TabOrder = 2
    Visible = False
    object LabelIngFuncRegFalsiMod: TLabel
      Left = 32
      Top = 51
      Width = 127
      Height = 13
      Caption = 'Ingrese la Funci'#243'n:  f(x) ='
    end
    object LabelTitleRegFalsiMod1: TLabel
      Left = 32
      Top = 16
      Width = 308
      Height = 19
      Caption = 'M'#201'TODO REGULA FALSI MODIFICADO'
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object LabelActGrafRegFalsiMod: TLabel
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
    object LabelMaxXRegFalsiMod: TLabel
      Left = 568
      Top = 168
      Width = 43
      Height = 13
      Caption = 'M'#225'x X = '
    end
    object LabelMaxYRegFalsiMod: TLabel
      Left = 568
      Top = 192
      Width = 43
      Height = 13
      Caption = 'M'#225'x Y = '
    end
    object LabelMinXRegFalsiMod: TLabel
      Left = 568
      Top = 224
      Width = 39
      Height = 13
      Caption = 'Min X = '
    end
    object LabelMinYRegFalsiMod: TLabel
      Left = 568
      Top = 248
      Width = 39
      Height = 13
      Caption = 'Min Y = '
    end
    object GraficadorRegFalsiMod: TGraficador
      Left = 56
      Top = 120
      Width = 481
      Height = 321
      minX = -3.000000000000000000
      minY = -3.000000000000000000
      maxX = 3.000000000000000000
      maxY = 3.000000000000000000
      step = 0.002000000000000000
    end
    object EditFuncionRegFalsiMod: TEdit
      Left = 168
      Top = 48
      Width = 385
      Height = 21
      TabOrder = 0
      OnKeyPress = EditFuncionRegFalsiModKeyPress
    end
    object ButtonGraficarRegFalsiMod: TButton
      Left = 576
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Graficar'
      TabOrder = 1
      OnClick = ButtonGraficarRegFalsiModClick
    end
    object ButtonZoomInRegFalsiMod: TButton
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
      TabOrder = 8
      OnClick = ButtonZoomInRegFalsiModClick
    end
    object EditMaxXRegFalsiMod: TEdit
      Left = 616
      Top = 168
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object EditMaxYRegFalsiMod: TEdit
      Left = 616
      Top = 192
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object EditMinXRegFalsiMod: TEdit
      Left = 616
      Top = 224
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object EditMinYRegFalsiMod: TEdit
      Left = 616
      Top = 248
      Width = 121
      Height = 21
      TabOrder = 6
    end
    object ButtonActDatosRegFalsiMod: TButton
      Left = 600
      Top = 280
      Width = 113
      Height = 25
      Caption = 'Actualizar Datos'
      TabOrder = 7
      OnClick = ButtonActDatosRegFalsiModClick
    end
    object ButtonZoomOutRegFalsiMod: TButton
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
      OnClick = ButtonZoomOutRegFalsiModClick
    end
    object PanelDatosRaizRegFalsiMod: TPanel
      Left = 32
      Top = 488
      Width = 521
      Height = 145
      BorderStyle = bsSingle
      TabOrder = 10
      Visible = False
      object LabelTitleRegFalsiMod2: TLabel
        Left = 8
        Top = 10
        Width = 175
        Height = 19
        Caption = 'C'#193'LCULO DE LA RA'#205'Z'
        Color = clMoneyGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object LabelErrorRegFalsiMod: TLabel
        Left = 8
        Top = 96
        Width = 89
        Height = 13
        Caption = 'Ingrese el Error = '
      end
      object LabelIntervaloRegFalsiMod: TLabel
        Left = 8
        Top = 56
        Width = 105
        Height = 13
        Caption = 'Ingrese el Intervalo : '
      end
      object LabelInfRegFalsiMod: TLabel
        Left = 120
        Top = 56
        Width = 28
        Height = 13
        Caption = 'Inf = '
      end
      object LabelSupRegFalsiMod: TLabel
        Left = 208
        Top = 56
        Width = 32
        Height = 13
        Caption = 'Sup = '
      end
      object EditErrorRegFalsiMod: TEdit
        Left = 112
        Top = 91
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object ButtonCalRaizRegFalsiMod: TButton
        Left = 392
        Top = 48
        Width = 89
        Height = 25
        Caption = 'Calcular Raiz'
        TabOrder = 1
        OnClick = ButtonCalRaizRegFalsiModClick
      end
      object ButtonLimpiarRegFalsiMod: TButton
        Left = 392
        Top = 88
        Width = 89
        Height = 25
        Caption = 'Limpiar'
        TabOrder = 2
      end
      object EditInfRegFalsiMod: TEdit
        Left = 152
        Top = 51
        Width = 41
        Height = 21
        TabOrder = 3
      end
      object EditSupRegFalsiMod: TEdit
        Left = 248
        Top = 51
        Width = 41
        Height = 21
        TabOrder = 4
      end
    end
    object PanelMuestraResultRegFalsiMod: TPanel
      Left = 32
      Top = 656
      Width = 521
      Height = 169
      BorderStyle = bsSingle
      TabOrder = 11
      Visible = False
      object LabelTitleRegFalsiMod3: TLabel
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
      object LabelRaizAproxRegFalsiMod: TLabel
        Left = 8
        Top = 88
        Width = 94
        Height = 13
        Caption = 'Ra'#237'z Aproximada = '
      end
      object LabelDerivada: TLabel
        Left = 8
        Top = 136
        Width = 38
        Height = 13
        Caption = 'f'#180'(x) = '
      end
      object LabelShowDerivadaRegFalsiMod: TLabel
        Left = 59
        Top = 136
        Width = 3
        Height = 13
      end
      object LabelCantIterRegFalsiMod: TLabel
        Left = 8
        Top = 112
        Width = 129
        Height = 13
        Caption = 'Cantidad de Iteraciones = '
      end
      object LabelShowCantIterRegFalsiMod: TLabel
        Left = 144
        Top = 112
        Width = 3
        Height = 13
      end
      object LabelShowErrorRegFalsiMod: TLabel
        Left = 8
        Top = 64
        Width = 38
        Height = 13
        Caption = 'Error = '
      end
      object LabelShowIntervaloRegFalsiMod: TLabel
        Left = 8
        Top = 40
        Width = 58
        Height = 13
        Caption = 'Intervalo = '
      end
    end
    object ButtonCancelarRegFalsiMod: TButton
      Left = 576
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = ButtonCancelarRegFalsiModClick
    end
  end
  object PanelMetRegFalsi: TPanel
    Left = -3
    Top = 0
    Width = 785
    Height = 850
    BevelInner = bvRaised
    BorderStyle = bsSingle
    TabOrder = 4
    Visible = False
    object LabelIngFuncionRegFalsi: TLabel
      Left = 32
      Top = 51
      Width = 127
      Height = 13
      Caption = 'Ingrese la Funci'#243'n:  f(x) ='
    end
    object LabelTitleRegFalsi1: TLabel
      Left = 32
      Top = 16
      Width = 200
      Height = 19
      Caption = 'M'#201'TODO REGULA FALSI '
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object LabelActGrafRegFalsi: TLabel
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
    object LabelMaxXRegFalsi: TLabel
      Left = 568
      Top = 168
      Width = 43
      Height = 13
      Caption = 'M'#225'x X = '
    end
    object LabelMaxYRegFalsi: TLabel
      Left = 568
      Top = 192
      Width = 43
      Height = 13
      Caption = 'M'#225'x Y = '
    end
    object LabelMinXRegFalsi: TLabel
      Left = 568
      Top = 224
      Width = 39
      Height = 13
      Caption = 'Min X = '
    end
    object LabelMinYRegFalsi: TLabel
      Left = 568
      Top = 248
      Width = 39
      Height = 13
      Caption = 'Min Y = '
    end
    object GraficadorRegFalsi: TGraficador
      Left = 32
      Top = 104
      Width = 513
      Height = 361
      minX = -3.000000000000000000
      minY = -3.000000000000000000
      maxX = 3.000000000000000000
      maxY = 3.000000000000000000
      step = 0.002000000000000000
    end
    object EditFuncionRegFalsi: TEdit
      Left = 168
      Top = 48
      Width = 385
      Height = 21
      TabOrder = 0
      OnKeyPress = EditFuncionRegFalsiKeyPress
    end
    object ButtonGraficarRegFalsi: TButton
      Left = 576
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Graficar'
      TabOrder = 1
      OnClick = ButtonGraficarRegFalsiClick
    end
    object ButtonZoomInRegFalse: TButton
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
      TabOrder = 8
      OnClick = ButtonZoomInRegFalseClick
    end
    object EditMaxXRegFalsi: TEdit
      Left = 616
      Top = 168
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object EditMaxYRegFalsi: TEdit
      Left = 616
      Top = 192
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object EditMinXRegFalsi: TEdit
      Left = 616
      Top = 224
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object EditMinYRegFalsi: TEdit
      Left = 616
      Top = 248
      Width = 121
      Height = 21
      TabOrder = 6
    end
    object ButtonActualizarGraficadorRegFalsi: TButton
      Left = 600
      Top = 280
      Width = 113
      Height = 25
      Caption = 'Actualizar Datos'
      TabOrder = 7
      OnClick = ButtonActualizarGraficadorRegFalsiClick
    end
    object ButtonZoomOutRegFalsi: TButton
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
      OnClick = ButtonZoomOutRegFalsiClick
    end
    object PanelDatosRaizRegFalsi: TPanel
      Left = 32
      Top = 488
      Width = 521
      Height = 145
      BorderStyle = bsSingle
      TabOrder = 10
      Visible = False
      object LabelTitleRegFalsi2: TLabel
        Left = 8
        Top = 10
        Width = 175
        Height = 19
        Caption = 'C'#193'LCULO DE LA RA'#205'Z'
        Color = clMoneyGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object LabelIngErrorRegFalsi: TLabel
        Left = 8
        Top = 96
        Width = 89
        Height = 13
        Caption = 'Ingrese el Error = '
      end
      object LabelIngIntervaloRegFalsi: TLabel
        Left = 8
        Top = 56
        Width = 105
        Height = 13
        Caption = 'Ingrese el Intervalo : '
      end
      object LabelInfRegFalsi: TLabel
        Left = 120
        Top = 56
        Width = 28
        Height = 13
        Caption = 'Inf = '
      end
      object LabelSupRegFalsi: TLabel
        Left = 208
        Top = 56
        Width = 32
        Height = 13
        Caption = 'Sup = '
      end
      object EditErrorRegFalsi: TEdit
        Left = 112
        Top = 91
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object ButtonCalRaizRegFalsi: TButton
        Left = 392
        Top = 48
        Width = 89
        Height = 25
        Caption = 'Calcular Raiz'
        TabOrder = 1
        OnClick = ButtonCalRaizRegFalsiClick
      end
      object ButtonLimpiarRegFalsi: TButton
        Left = 392
        Top = 88
        Width = 89
        Height = 25
        Caption = 'Limpiar'
        TabOrder = 2
      end
      object EditInfRegFalsi: TEdit
        Left = 152
        Top = 51
        Width = 41
        Height = 21
        TabOrder = 3
      end
      object EditSupRegFalsi: TEdit
        Left = 248
        Top = 51
        Width = 41
        Height = 21
        TabOrder = 4
      end
    end
    object PanelMuestraResultRegFalsi: TPanel
      Left = 32
      Top = 656
      Width = 521
      Height = 169
      BorderStyle = bsSingle
      TabOrder = 11
      Visible = False
      object LabelTitleRegFalsi3: TLabel
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
      object LabelRaizAproxRegFalsi: TLabel
        Left = 8
        Top = 88
        Width = 94
        Height = 13
        Caption = 'Ra'#237'z Aproximada = '
      end
      object LabelDerivadaRegFalsi: TLabel
        Left = 8
        Top = 136
        Width = 38
        Height = 13
        Caption = 'f'#180'(x) = '
      end
      object LabelShowDerivadaRegFalsi: TLabel
        Left = 59
        Top = 136
        Width = 3
        Height = 13
      end
      object LabelCantIterRegFalsi: TLabel
        Left = 8
        Top = 112
        Width = 129
        Height = 13
        Caption = 'Cantidad de Iteraciones = '
      end
      object LabelShowCantIterRegFalsi: TLabel
        Left = 144
        Top = 112
        Width = 3
        Height = 13
      end
      object LabelShowErrorRegFalsi: TLabel
        Left = 8
        Top = 64
        Width = 38
        Height = 13
        Caption = 'Error = '
      end
      object LabelShowIntervaloRegFalsi: TLabel
        Left = 8
        Top = 40
        Width = 58
        Height = 13
        Caption = 'Intervalo = '
      end
    end
    object ButtonCancelarRegFalsi: TButton
      Left = 576
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = ButtonCancelarRegFalsiClick
    end
  end
  object PanelMetSecante: TPanel
    Left = -12
    Top = -3
    Width = 793
    Height = 848
    BevelInner = bvRaised
    BorderStyle = bsSingle
    TabOrder = 3
    Visible = False
    object LabelIngFuncSecante: TLabel
      Left = 32
      Top = 51
      Width = 127
      Height = 13
      Caption = 'Ingrese la Funci'#243'n:  f(x) ='
    end
    object LabelTitleSecante: TLabel
      Left = 32
      Top = 16
      Width = 205
      Height = 19
      Caption = 'M'#201'TODO DE LA SECANTE'
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object LabelActGrafSec: TLabel
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
    object LabelMaxXGrafSec: TLabel
      Left = 568
      Top = 168
      Width = 43
      Height = 13
      Caption = 'M'#225'x X = '
    end
    object LabelMaxYGrafSec: TLabel
      Left = 568
      Top = 192
      Width = 43
      Height = 13
      Caption = 'M'#225'x Y = '
    end
    object LabelMinXGrafSec: TLabel
      Left = 568
      Top = 224
      Width = 39
      Height = 13
      Caption = 'Min X = '
    end
    object LabelMinYGrafSec: TLabel
      Left = 568
      Top = 248
      Width = 39
      Height = 13
      Caption = 'Min Y = '
    end
    object GraficadorSecante: TGraficador
      Left = 40
      Top = 88
      Width = 505
      Height = 385
      minX = -3.000000000000000000
      minY = -3.000000000000000000
      maxX = 3.000000000000000000
      maxY = 3.000000000000000000
      step = 0.002000000000000000
    end
    object EditFuncionSecante: TEdit
      Left = 168
      Top = 48
      Width = 385
      Height = 21
      TabOrder = 0
      OnKeyPress = EditFuncionSecanteKeyPress
    end
    object ButtonGraficarFuncSec: TButton
      Left = 576
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Graficar'
      TabOrder = 1
      OnClick = ButtonGraficarFuncSecClick
    end
    object ButtonZoomInGrafSec: TButton
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
      TabOrder = 8
      OnClick = ButtonZoomInGrafSecClick
    end
    object ButtonCancelarSec: TButton
      Left = 576
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = ButtonCancelarSecClick
    end
    object EditMaxXGrafSec: TEdit
      Left = 616
      Top = 168
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object EditMaxYGrafSec: TEdit
      Left = 616
      Top = 192
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object EditMinXGrafSec: TEdit
      Left = 616
      Top = 224
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object EditMinYGrafSec: TEdit
      Left = 616
      Top = 248
      Width = 121
      Height = 21
      TabOrder = 6
    end
    object ButtonActDatosGrafSec: TButton
      Left = 600
      Top = 280
      Width = 113
      Height = 25
      Caption = 'Actualizar Datos'
      TabOrder = 7
      OnClick = ButtonActDatosGrafSecClick
    end
    object ButtonZoomOutGrafSec: TButton
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
      OnClick = ButtonZoomOutGrafSecClick
    end
    object PanelCalRaizSecante: TPanel
      Left = 32
      Top = 488
      Width = 521
      Height = 161
      BorderStyle = bsSingle
      TabOrder = 10
      Visible = False
      object LabelTitle2Secante: TLabel
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
      object LabelIngErrorSecante: TLabel
        Left = 8
        Top = 88
        Width = 89
        Height = 13
        Caption = 'Ingrese el Error = '
      end
      object LabelPtoX0Secante: TLabel
        Left = 8
        Top = 128
        Width = 108
        Height = 13
        Caption = 'Ingrese el punto x0 = '
      end
      object LabelIngIntSecante: TLabel
        Left = 8
        Top = 48
        Width = 105
        Height = 13
        Caption = 'Ingrese el Intervalo : '
      end
      object LabelInfSecante: TLabel
        Left = 120
        Top = 48
        Width = 28
        Height = 13
        Caption = 'Inf = '
      end
      object LabelSupSecante: TLabel
        Left = 208
        Top = 48
        Width = 32
        Height = 13
        Caption = 'Sup = '
      end
      object EditErrorSecante: TEdit
        Left = 112
        Top = 83
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object ButtonCalcularRaizSecante: TButton
        Left = 392
        Top = 48
        Width = 89
        Height = 25
        Caption = 'Calcular Raiz'
        TabOrder = 1
        OnClick = ButtonCalcularRaizSecanteClick
      end
      object ButtonLimpiarSecante: TButton
        Left = 392
        Top = 112
        Width = 89
        Height = 25
        Caption = 'Limpiar'
        TabOrder = 2
      end
      object EditPtoX0Secante: TEdit
        Left = 128
        Top = 123
        Width = 123
        Height = 21
        TabOrder = 3
      end
      object EditInfSecante: TEdit
        Left = 152
        Top = 43
        Width = 41
        Height = 21
        TabOrder = 4
      end
      object EditSupSecante: TEdit
        Left = 248
        Top = 43
        Width = 41
        Height = 21
        TabOrder = 5
      end
    end
    object PanelResultSecante: TPanel
      Left = 32
      Top = 656
      Width = 521
      Height = 169
      BorderStyle = bsSingle
      TabOrder = 11
      object LabelTitle3Secante: TLabel
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
      object LabelRaizAproxSecante: TLabel
        Left = 8
        Top = 88
        Width = 94
        Height = 13
        Caption = 'Ra'#237'z Aproximada = '
      end
      object LabelDerivadaSecante: TLabel
        Left = 8
        Top = 136
        Width = 38
        Height = 13
        Caption = 'f'#180'(x) = '
      end
      object LabelShowDerivadaSecante: TLabel
        Left = 59
        Top = 136
        Width = 3
        Height = 13
      end
      object LabelCantIterSecante: TLabel
        Left = 8
        Top = 112
        Width = 129
        Height = 13
        Caption = 'Cantidad de Iteraciones = '
      end
      object LabelShowCantIterSecante: TLabel
        Left = 144
        Top = 112
        Width = 3
        Height = 13
      end
      object LabelShowPtoX0Secante: TLabel
        Left = 8
        Top = 64
        Width = 57
        Height = 13
        Caption = 'Punto x0 = '
      end
      object LabelIntervaloSecante: TLabel
        Left = 8
        Top = 40
        Width = 58
        Height = 13
        Caption = 'Intervalo = '
      end
    end
  end
  object PanelMetBiseccion: TPanel
    Left = 0
    Top = 0
    Width = 785
    Height = 849
    BevelInner = bvRaised
    BorderStyle = bsSingle
    TabOrder = 0
    Visible = False
    object LabelFuncionBis: TLabel
      Left = 32
      Top = 51
      Width = 127
      Height = 13
      Caption = 'Ingrese la Funci'#243'n:  f(x) ='
    end
    object LabelTitleBis1: TLabel
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
    object LabeMaxXBis: TLabel
      Left = 568
      Top = 168
      Width = 43
      Height = 13
      Caption = 'M'#225'x X = '
    end
    object LabelMaxYBis: TLabel
      Left = 568
      Top = 192
      Width = 43
      Height = 13
      Caption = 'M'#225'x Y = '
    end
    object LabelMinXBis: TLabel
      Left = 568
      Top = 224
      Width = 39
      Height = 13
      Caption = 'Min X = '
    end
    object LabelMinYBis: TLabel
      Left = 568
      Top = 248
      Width = 39
      Height = 13
      Caption = 'Min Y = '
    end
    object GraficadorBiseccion: TGraficador
      Left = 24
      Top = 80
      Width = 513
      Height = 401
      minX = -3.000000000000000000
      minY = -3.000000000000000000
      maxX = 3.000000000000000000
      maxY = 3.000000000000000000
      step = 0.002000000000000000
    end
    object EditFuncionBis: TEdit
      Left = 168
      Top = 48
      Width = 385
      Height = 21
      TabOrder = 0
      OnKeyPress = EditFuncionBisKeyPress
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
      TabOrder = 8
      OnClick = ButtonZoomInBisClick
    end
    object ButtonCancelarBis: TButton
      Left = 576
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = ButtonCancelarBisClick
    end
    object EditMaxXBis: TEdit
      Left = 616
      Top = 168
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object EditMaxYBis: TEdit
      Left = 616
      Top = 192
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object EditMinXBis: TEdit
      Left = 616
      Top = 224
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object EditMinYBis: TEdit
      Left = 616
      Top = 248
      Width = 121
      Height = 21
      TabOrder = 6
    end
    object ButtonActualizarGraficadorBis: TButton
      Left = 600
      Top = 280
      Width = 113
      Height = 25
      Caption = 'Actualizar Datos'
      TabOrder = 7
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
    object PanelDatosRaizBiseccion: TPanel
      Left = 32
      Top = 504
      Width = 521
      Height = 113
      BorderStyle = bsSingle
      TabOrder = 10
      Visible = False
      object LabelTitleRaizBis: TLabel
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
      object LabelIntervaloBis: TLabel
        Left = 8
        Top = 40
        Width = 156
        Height = 13
        Caption = 'Ingrese el Intervalo (inf,sup) =  '
      end
      object LabelErrorBis: TLabel
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
      object EditErrorBis: TEdit
        Left = 104
        Top = 67
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object ButtonCalRaizBis: TButton
        Left = 392
        Top = 24
        Width = 89
        Height = 25
        Caption = 'Calcular Raiz'
        TabOrder = 3
        OnClick = ButtonCalRaizBisClick
      end
      object ButtonLimpiarBis: TButton
        Left = 392
        Top = 56
        Width = 89
        Height = 25
        Caption = 'Limpiar'
        TabOrder = 4
      end
      object EditSupBiseccion: TEdit
        Left = 272
        Top = 35
        Width = 41
        Height = 21
        TabOrder = 1
      end
    end
    object PanelMuestraResultBiseccion: TPanel
      Left = 32
      Top = 640
      Width = 521
      Height = 161
      BorderStyle = bsSingle
      TabOrder = 11
      Visible = False
      object LabelMuestraResultBis: TLabel
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
      object LabelIntervaloBiseccion: TLabel
        Left = 8
        Top = 48
        Width = 58
        Height = 13
        Caption = 'Intervalo = '
      end
      object LabelShowRaizBis: TLabel
        Left = 8
        Top = 72
        Width = 94
        Height = 13
        Caption = 'Ra'#237'z Aproximada = '
      end
      object LabelDerivadaBis: TLabel
        Left = 8
        Top = 120
        Width = 38
        Height = 13
        Caption = 'f'#180'(x) = '
      end
      object LabelShowDerivadaBis: TLabel
        Left = 51
        Top = 120
        Width = 3
        Height = 13
      end
      object LabelCantIterBis: TLabel
        Left = 8
        Top = 96
        Width = 129
        Height = 13
        Caption = 'Cantidad de Iteraciones = '
      end
      object LabelShowCantIterBis: TLabel
        Left = 144
        Top = 96
        Width = 3
        Height = 13
      end
    end
  end
  object MainMenu: TMainMenu
    Left = 824
    Top = 16
    object MenuArchivo: TMenuItem
      Caption = 'Archivo'
      object MenuItemBiseccion: TMenuItem
        Caption = 'M'#233'todo de Bisecci'#243'n'
        ShortCut = 16449
        OnClick = MenuItemBiseccionClick
      end
      object MenuItemSecante: TMenuItem
        Caption = 'M'#233'todo de la Secante'
        ShortCut = 16450
        OnClick = MenuItemSecanteClick
      end
      object MenuItemNewton: TMenuItem
        Caption = 'M'#233'todo de Newton'
        ShortCut = 16454
        OnClick = MenuItemNewtonClick
      end
      object MenuItemRegFalsiMod: TMenuItem
        Caption = 'M'#233'todo Regula Falsi Modificado'
        ShortCut = 16452
        OnClick = MenuItemRegFalsiModClick
      end
      object MenuItemRegulaFalsi: TMenuItem
        Caption = 'M'#233'todo Regula Falsi'
        ShortCut = 16453
        OnClick = MenuItemRegulaFalsiClick
      end
      object MenuItemSalir: TMenuItem
        Caption = 'Salir'
        ShortCut = 16465
        OnClick = MenuItemSalirClick
      end
    end
    object MenuAyuda: TMenuItem
      Caption = 'Ayuda'
      object MenuItemAbout: TMenuItem
        Caption = 'Sobre de'
      end
    end
  end
end
