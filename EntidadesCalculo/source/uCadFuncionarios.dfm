object frmFuncionarios: TfrmFuncionarios
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Funcion'#225'rios'
  ClientHeight = 360
  ClientWidth = 613
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgcFuncionarios: TPageControl
    Left = 0
    Top = 0
    Width = 613
    Height = 360
    ActivePage = tsPesquisar
    Align = alClient
    TabOrder = 0
    object Cadastro: TTabSheet
      Caption = 'Cadastro'
      object CadastroGroupBox: TGroupBox
        Left = 0
        Top = 0
        Width = 601
        Height = 289
        TabOrder = 0
        object lblNomeFuncionario: TLabel
          Left = 17
          Top = 16
          Width = 27
          Height = 13
          Caption = 'Nome'
        end
        object lblCPF: TLabel
          Left = 17
          Top = 43
          Width = 19
          Height = 13
          Caption = 'CPF'
        end
        object lblSalario: TLabel
          Left = 209
          Top = 46
          Width = 32
          Height = 13
          Caption = 'Sal'#225'rio'
        end
        object lblINSS: TLabel
          Left = 17
          Top = 73
          Width = 23
          Height = 13
          Caption = 'INSS'
        end
        object lblIR: TLabel
          Left = 209
          Top = 75
          Width = 11
          Height = 13
          Caption = 'IR'
        end
        object edtNomeFuncionario: TMaskEdit
          Left = 78
          Top = 16
          Width = 513
          Height = 21
          TabOrder = 0
          Text = ''
        end
        object edtCPF: TMaskEdit
          Left = 78
          Top = 43
          Width = 102
          Height = 21
          EditMask = '!999.999.999-99;0; '
          MaxLength = 14
          TabOrder = 1
          Text = ''
        end
        object edtSalario: TMaskEdit
          Left = 270
          Top = 43
          Width = 115
          Height = 21
          TabOrder = 2
          Text = ''
        end
        object edtINSS: TMaskEdit
          Left = 78
          Top = 71
          Width = 115
          Height = 21
          Enabled = False
          TabOrder = 3
          Text = ''
        end
        object edtIR: TMaskEdit
          Left = 270
          Top = 70
          Width = 115
          Height = 21
          Enabled = False
          TabOrder = 4
          Text = ''
        end
        object gbDependentes: TGroupBox
          Left = 17
          Top = 98
          Width = 534
          Height = 185
          Caption = 'Dependentes '
          TabOrder = 5
          object lblNomeDependente: TLabel
            Left = 18
            Top = 23
            Width = 27
            Height = 13
            Caption = 'Nome'
          end
          object lblCalculaIR: TLabel
            Left = 18
            Top = 59
            Width = 48
            Height = 13
            Caption = 'Calcula IR'
          end
          object lblCalculaINSS: TLabel
            Left = 208
            Top = 59
            Width = 60
            Height = 13
            Caption = 'Calcula INSS'
          end
          object edtNomeDependente: TMaskEdit
            Left = 63
            Top = 20
            Width = 451
            Height = 21
            TabOrder = 0
            Text = ''
          end
          object cbCalculaIR: TComboBox
            Left = 74
            Top = 51
            Width = 49
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 1
            Text = 'N'#227'o'
            Items.Strings = (
              'N'#227'o'
              'Sim')
          end
          object cbCalculaINSS: TComboBox
            Left = 274
            Top = 51
            Width = 49
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 2
            Text = 'N'#227'o'
            Items.Strings = (
              'N'#227'o'
              'Sim')
          end
          object btnAdicionar: TButton
            Left = 439
            Top = 47
            Width = 75
            Height = 25
            Caption = 'Adicionar'
            TabOrder = 3
            OnClick = btnAdicionarClick
          end
          object lbDependentes: TListBox
            Left = 18
            Top = 78
            Width = 496
            Height = 97
            ItemHeight = 13
            TabOrder = 4
          end
        end
      end
      object pnlBotoes: TPanel
        Left = 0
        Top = 293
        Width = 605
        Height = 39
        Align = alBottom
        TabOrder = 1
        object btnNovo: TSpeedButton
          Left = 35
          Top = 2
          Width = 88
          Height = 30
          Cursor = crHandPoint
          Caption = '&Novo'
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF58A47158A47158A47158A47158A4
            7158A47158A47158A471FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF58A37085BD9D
            85BD9D85BD9D85BD9D85BD9D85BD9D56A26EFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF56A26C84D5B15ED09D5ED09D5ED09D5ED09D70C79C53A06AFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF53A0698CD8B662D19F62D19F62D19F62D19F73C89E50
            9E67FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF509D6592DBBA67D2A267D2A267D2
            A267D2A275C9A04D9B63FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D9A6097DDBE
            6CD3A56CD3A56CD3A56CD3A57ACBA24A985EFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF49975C99DEC072D5A872D5A872D5A872D5A87FCBA546955AFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF4593579ADFC078D6AC78D6AC78D6AC78D6AC84CDA942
            9155FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF58A47158A370
            56A26C53A069509D654D9A6049975C4593573E8E5098DEBF7ED8B07ED8B07ED8
            B07ED8B08ACFAB3E8E5042915546955A4A985E4D9B63509E6753A06A56A26E58
            A47158A471A7E6CA74CAA072C89D74C99F78CBA17ECBA482CCA888CFAA8ED0AD
            85DAB485DAB485DAB485DAB477C9A072C89D74C99F78CBA17ECBA482CCA888CF
            AA8ED0AD85BD9D58A47158A471A7E6CA8CDCB88CDCB88CDCB88CDCB88CDCB88C
            DCB88CDCB88CDCB88CDCB88CDCB88CDCB88CDCB88CDCB88CDCB88CDCB88CDCB8
            8CDCB88CDCB88CDCB88CDCB885BD9D58A47158A471A7E6CA93DDBC93DDBC93DD
            BC93DDBC93DDBC93DDBC93DDBC93DDBC93DDBC93DDBC93DDBC93DDBC93DDBC93
            DDBC93DDBC93DDBC93DDBC93DDBC93DDBC93DDBC85BD9D58A47158A471A7E6CA
            99DFC099DFC099DFC099DFC099DFC099DFC099DFC099DFC099DFC099DFC099DF
            C099DFC099DFC099DFC099DFC099DFC099DFC099DFC099DFC099DFC085BD9D58
            A47158A471A7E6CAA0E1C4A0E1C4A0E1C4A0E1C4A0E1C4A0E1C4A0E1C4A0E1C4
            A0E1C4A0E1C4A0E1C4A0E1C4A0E1C4A0E1C4A0E1C4A0E1C4A0E1C4A0E1C4A0E1
            C4A0E1C485BD9D58A47158A471A7E6CA94DDBD98DEBF9ADFC099DEC097DDBE92
            DBBA8CD8B684D5B1A7E3C8A7E3C8A7E3C8A7E3C87AD0A69ADFC09ADFC099DEC0
            97DDBE92DBBA8CD8B684D5B185BD9D58A47158A47156A26E53A06A509E674D9B
            634A985E46955A4291553E8E508CD8B6ADE5CCADE5CCADE5CCADE5CC80D1A93E
            8E5045935749975C4D9A60509D6553A06956A26C58A37058A471FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF45935792DBBAB3E6D0B3E6D0B3E6
            D0B3E6D087D1AC429155FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF49975C97DDBE
            B9E8D3B9E8D3B9E8D3B9E8D38CD2AE46955AFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF4D9A6099DEC0BEE9D6BEE9D6BEE9D6BEE9D691D3B14A985EFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF509D659ADFC0C3EAD9C3EAD9C3EAD9C3EAD996D3B24D
            9B63FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF53A06998DEBFC7EBDBC7EBDBC7EB
            DBC7EBDB9BD4B5509E67FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF56A26C94DDBD
            CAECDDCAECDDCAECDDCAECDD9ED5B753A06AFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF58A370A7E6CAA7E6CAA7E6CAA7E6CAA7E6CAA7E6CA56A26EFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF58A47158A47158A47158A47158A47158A47158A47158
            A471FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = Execute
        end
        object btnSalvar: TSpeedButton
          Left = 131
          Top = 2
          Width = 88
          Height = 30
          Cursor = crHandPoint
          Caption = '&Salvar'
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0DED3A2BCA6789678688A69688A
            69789678A2BDA7D0DED3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0C5B3305F322B592C2B5629
            3B7043447D50447D503B70432B56292B592C305F32AFC5B3FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDE8E0688F6C2C5D2E3F
            784A6BB68B86DBB187DEB384D8AE84D8AE87DEB386DBB16BB68B3F784A2C5D2E
            688E6CDDE8E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1E0D42F64
            372C613370B78E8EDFB77ED1A469BD855AB47459B27159B2715AB47469BD857E
            D1A48EDFB770B78E2C61332F6337D0E0D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            DDE9E12F683A38734488D3AC8AD7AE61B87C50AE6654B16C56B26E56B26E56B2
            6E56B26E54B16C50AE6661B87C8AD7AE88D2AC3874442F683ADDE9E1FFFFFFFF
            FFFFFFFFFFFFFFFF6896722B67388DD4AF8AD6AD55B16C56B06E59B27259B272
            59B27259B27259B27259B27259B27259B27256B06E55B16C8AD6AD8DD4AF2B67
            37699673FFFFFFFFFFFFFFFFFFB1CBB82A6A397BBD9796DCB65AB1705BB4715D
            B5745DB5745DB57455B16D4FAE675DB5735DB5745DB5745DB5745DB5745BB471
            5AB17096DCB67BBD972A6938B1CCB9FFFFFFFFFFFF2F7544428659A6E5C76CBD
            845BB3715EB6755EB6755EB5754EAE6780C693CAE9D241A95D5DB5745EB6755E
            B6755EB6755EB6755BB3716ABD84A6E5C74286592E7443FFFFFFD2E4D828713E
            84C4A097D8B358B16E61B67961B67961B67851AF698BCB9BFFFFFFFFFFFFD1EB
            D94DAD665FB57761B67961B67961B67961B67958B16E97D8B384C4A028713ED3
            E4D9A6C9B124743EB0E6CB7DC69662B67766B97C65B87B4EAE68A0D6AFFFFFFF
            FFFFFFFFFFFFFFFFFFDFF1E349AC6463B77966B97C66B97C66B97C62B6777DC6
            96B0E6CB24743EA7CAB376AD8A408D5CB5E7D16DBC8367B97B68B97D5FB576B5
            DFC0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9F5ED58B37065B87A69BA7D
            69BA7D67B97B6DBC83B5E7D1408D5C76AC8A67A37E4D996EB3E5CD6DBB826ABA
            7F68B97D7CC490FFFFFFFFFFFFFFFFFFFFFFFFFCFDFCFFFFFFFFFFFFFFFFFFF2
            F9F456B06E67B87D6CBB816ABA7F6DBB82B3E5CD4D996E67A37E66A77F509C6F
            B9E6D071BD866DBB826FBB8465B77C76C289FFFFFFFFFFFF99D2A851AF6AFFFF
            FFFFFFFFFFFFFFFFFFFFFAFDFA68B87D69B87F6DBB8271BD86B9E6D0509C6F66
            A77F75B18E409564C3EBDA76BF8B70BD8572BE8772BE8768B87E85C9969FD3AD
            61B6796BBA8171C087FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF76C18A6DBB8276BF
            8BC3EBDA40956474B18EA6D0B820854AC4EADB8ECEA270BD8474C08974C08974
            C08970BD856DBC8274C08974C0896CBB8176C289FFFFFFFFFFFFFFFFFFFFFFFF
            8BCB9C6CBB808ECEA2C4EADB1F8449A8D2BAD3E9DC218B4F99CFB4B2E0C76EBB
            7F79C18A79C18A79C18A79C18A79C18A79C18A79C18A79C18A6EBB818FCD9FFF
            FFFFDDEFE16CBD8072BD856EBB7FB2E0C799CFB4208A4ED4E9DEFFFFFF299459
            45A26FCFEDE588CB9C77BF897CC28E7CC28E7CC28E7CC28E7CC28E7CC28E7CC2
            8E7CC28E72BD8586CA986AB97E7AC08C77BF8988CB9CCFEDE545A26F279358FF
            FFFFFFFFFFB1D9C32091549ED2B8C6E8DC7AC28B7BC18D7DC2907DC2907DC290
            7DC2907DC2907DC2907DC2907DC2907AC18D7DC2907BC18D7AC28BC6E8DA9ED2
            B81F9154B2DAC4FFFFFFFFFFFFFFFFFF65B78C209558C7E7D9C4E6D87DC38C7C
            C28D80C49180C49180C49180C49180C49180C49180C49180C4917CC28D7DC38C
            C4E6D8C7E7D920955864B68CFFFFFFFFFFFFFFFFFFFFFFFFDFF0E7259D6036A4
            6CCCE8DFCFEBE193CEA379C38880C69083C79283C79383C79383C79280C69079
            C38893CEA3CFEBE1CCE8DF36A46C249D5FDFF1E8FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFD3ECDF24A0631F9D5EA9D9C4E4F3F3C9E6DBA4D5B48CCB9B89C99A89C9
            9A8CCB9BA4D5B4C9E6DBE4F3F3A9D9C41F9D5E24A062D3ECDFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFDFF1E862BE931B9F5F48B17FACDCC8E7F2F4
            EBF5F6E3F0F0E3F0F0EBF5F6E7F2F4ACDCC848B17F1B9F5F63BE93DFF1E9FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2DFCA26
            A86D1BA26318A26141B27F57BA8D57BA8D41B27F18A1611BA26325A76CB2DFCA
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFD5EEE3AADDC672C9A162C39762C39772C9A1ABDDC6D6
            EFE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = SaveExecute
        end
        object btnCalculaImposto: TSpeedButton
          Left = 323
          Top = 2
          Width = 88
          Height = 30
          Cursor = crHandPoint
          Caption = '&Impostos'
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFB0B0B07A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A
            7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7AB0B0B0FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF7C7C7CD0D0D1D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0
            D1D1D1D1D0D0D1D1D1D0D0D0D0D0D0D0D0D0D0D0D0D1D0D0D0D1D0D1D0D0D1D0
            D07C7C7CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7E7E7ED2D1D292929292929292
            9292D2D1D2929292929292929292D1D2D2929292929292929292D2D2D25AB370
            5AB2705AB271D2D1D17E7E7EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF818181D4D4
            D3A4A3A4ECECECA4A4A3D3D4D3A4A3A4ECECECA4A4A3D4D4D3A4A3A4ECECECA4
            A4A3D4D3D45FB5756FD2895FB575D3D3D4818181FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF848484D5D5D5BBBBBBBBBCBCBCBCBBD5D6D5BBBBBBBBBCBCBCBCBBD5D5
            D6BBBBBBBBBCBCBCBCBBD5D6D566B87B6FD28965B87BD6D5D5848484FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF878787D7D7D7D7D7D7D7D8D7D7D7D7D7D7D7D7D7D7
            D7D7D8D7D7D7D7D7D7D8D7D7D7D8D7D7D7D7D8D7D76DBB816FD2896DBC81D7D7
            D7878787FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B8B8BDAD9D9D9D9D9D9D9DAD9
            D9D9D9D9D9DAD9D9D9D9D9D9D9DADAD9D9D9D9D9DADAD9DAD9DAD9D9D974BF88
            6FD28974BE87D9D9D98B8B8BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E8E8EDBDC
            DB929292929292929292DBDBDB929292929292929292DCDBDC92929292929292
            9292DBDCDB7BC18C6FD2897BC28DDBDCDB8E8E8EFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF929292DEDEDEA4A3A4ECECECA4A4A3DEDDDEA4A3A4ECECECA4A4A3DDDE
            DDA4A3A4ECECECA4A4A3DDDEDE80C4916FD28980C591DDDDDD929292FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF969696DFE0E0BBBBBBBBBCBCBCBCBBDFE0E0BBBBBB
            BBBCBCBCBCBBE0E0E0BBBBBBBBBCBCBCBCBBE0E0E084C79584C79584C795E0E0
            E0969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AE3E2E2E2E2E2E2E2E3E2
            E2E2E3E2E3E2E3E2E2E3E2E2E2E3E2E2E2E2E3E2E3E3E2E2E2E2E2E2E2E2E2E2
            E3E2E2E2E3E2E2E3E29A9A9AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9EE5E4
            E5E5E4E5E4E5E5E4E4E5E4E4E4E4E5E5E5E5E4E5E5E4E4E4E4E5E4E4E5E4E5E4
            E5E5E5E5E5E5E5E5E5E5E4E5E5E5E5E5E59E9E9EFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFA1A1A1E7E7E7929292929292929292E6E7E7929292929292929292E7E7
            E7929292929292929292E6E7E74D4CE74D4CE74C4CE8E7E7E7A1A1A1FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFA5A5A5E9E9E9A4A3A4ECECECA4A4A3E9E9E9A4A3A4
            ECECECA4A4A3E9E9E9A4A3A4ECECECA4A4A3E9E9E96767DF0000FF6767DFEAE9
            E9A5A5A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A9A9ECECECBBBBBBBBBCBCBC
            BCBBEBECEBBBBBBBBBBCBCBCBCBBECECEBBBBBBBBBBCBCBCBCBBECEBEC7B7AD8
            7B7BD87A7AD8EBEBECA9A9A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADEEEE
            EDEEEEEEEDEEEEEDEEEDEEEEEEEEEEEEEEEDEEEEEEEEEDEDEEEEEDEEEDEDEDEE
            EEEEEDEEEEEDEDEDEEEDEEEEEEEEEEEEEEADADADFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFB0B0B0EFEFF0EFF0F0F0F0F0EFEFEFF0EFF0EFF0F0F0F0F0F0F0F0F0EF
            F0F0EFF0F0F0F0F0EFF0F0F0F0F0F0EFF0EFEFF0F0F0F0F0F0B0B0B0FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFB4B4B4F2F1F1326637326637326637326637326637
            326637326637326637326637326637326637326637326637326637326637F2F2
            F1B4B4B4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B7F4F4F4326637E5F6E9E5
            F6E9DEF2E3D1ECD8C1E4CBAFDCBB9ED3AC8CC99C7BC18E6DB98261B47960B578
            5EB276326637F4F4F4B7B7B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBABABAF6F6
            F5326637EBFBEFEBFBEFE8F9ECDDF4E3CEECD6BBE4C7A9DAB696D1A684C89774
            BF8967B87E60B57860B578326637F5F5F6BABABAFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFBDBDBDF7F7F7326637EBFBEFEBFBEFEBFBEFE1F6E7D4EFDBC2E7CDB0DE
            BC9DD4AC8ACB9C7AC28E6BBB8261B57960B578326637F7F7F7BDBDBDFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFBFBFBFF9F8F9326637326637326637326637326637
            326637326637326637326637326637326637326637326637326637326637F9F9
            F9BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1C1C1FAFAFAFAFAFAFAFAFAFA
            FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAF9FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
            FAFAFAFAFAFAFAFAFAC1C1C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCC3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
            C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3DCDCDCFFFFFFFFFFFF}
          OnClick = btnCalculaImpostoClick
        end
        object btnSair: TSpeedButton
          Left = 420
          Top = 3
          Width = 88
          Height = 30
          Cursor = crHandPoint
          Action = SairAction
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00044534386B5457837679
            9C9799B4B9BBCCD8D9E3F5F6F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0C317C0C317C0C317C000A4D
            3B68AC33599D3152962B488C21397D15286C0A185C020C4F010D510312570416
            5D061C6507236B092872FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A317D0C
            0D0F0C0D0F0011564477BB4F82C75A8DD26295DA6699DE6598DD679ADF6497DC
            6295DA5787CC426EB32E55991D3F84001257FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF0C35820E10120E0F120018613467AB3164A8396CB03F72B6487BBE51
            84C85A8DD25A8DD25E91D65E91D65689CE4679BD3D70B4001962FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF0E3986101214111114001F6A3366AA295CA0295C
            A0285B9F275A9E376AAC6295DB315FAB25589C275A9E2A5DA13063A6396CB000
            206BFFFFFFFFFFFFFFFFFFF9FCFAFFFFFFFFFFFF113F8B13141713131700226D
            3467AB2A5DA12B5EA22B5EA22B5EA23363A95F92D7305EA82B5EA22B5EA22B5E
            A22B5CA03A6CB100236EFFFFFFFFFFFFFFFFFF002FE6FFFFFFFFFFFF13429015
            161A14161A0024703467AB2A5DA12B5EA22B5EA22A5DA12E5CA25A8DD22E5CA5
            2B5EA22B5EA22B5EA22655993B6DB2002571FFFFFFFFFFFFFFFFFF002FE60018
            DAFFFFFF16469417181D16191E0026723467AB295CA02B5EA22B5EA2295B9F28
            569B5588CD2C59A22B5EA22B5EA22B5EA22350943D6FB4012773FFFFFFFFFFFF
            FFFFFF002FE61569FF0109CB184A9A191B21191B200028753568AC295CA02B5E
            A22B5EA2245297204A905083C82B579F2B5EA22B5EA22B5DA11E488C3E70B501
            29760033EE0033EE0033EE002FE61669FF095EFE0400B41B1E231B1E23002A78
            3669AD295CA0295B9F245296194085163C844B7EC328549D2B5EA22A5CA02350
            9413387B4072B7012B790033EE5DA2FF3F87FF2876FF1569FF095EFE0055FE08
            009D1E2026002C7A2B599F1D478A1B4488153B7F0E2C700E2E75487BC026529A
            1D498D1A438713367A0B286C4274B9012D7B0033EE599FFF4089FF2874FF1568
            FF095EFE0055FE0052FD070081002E7D142669142669477ABF477ABF477ABF47
            7ABF477ABF477ABF477ABF477ABF477ABF477ABF4376BB012F7E0033EE5DA2FF
            3F87FF2876FF1568FF095DFE0055FE0052FD070081002F7F3166B45287D1315E
            AA315FAA305EA93361AC477ABF315FAA305DA8305DA9305EA8305DA94578BD01
            30800033EE5DA2FF4089FF2876FF1669FF095DFE0055FE08009D25282F003182
            6EA1E880B3F8285B9F285B9F2A5DA03366A84C7FC426529A285B9F285B9F285B
            9F2B5EA2477ABF0132830033EE0033EE0033EE002CE61569FF095DFE0400B428
            2A32272A32003384386BAF24579B275A9E275A9E275A9E2F60A45487CC2B57A0
            275A9E275A9E275A9E245599497CC1013485FFFFFFFFFFFFFFFFFF002CE61668
            FF0109CB2560B12A2D35292C35003586386BAF24579B26599D26599D25589C2C
            5BA05E91D62D5BA426599D25589C24579B204F924A7DC2013687FFFFFFFFFFFF
            FFFFFF002CE60018DAFFFFFF2560B12B2F372B2F37003689386BAF2255992558
            9C25589C24569A28569C699CE1325FAA24579B24579B24579B1B478A4C7FC401
            378AFFFFFFFFFFFFFFFFFF002CE6FFFFFFFFFFFF2560B12D313A2D313A00388B
            386BAF21549824579B24579B20509325509773A6EB3563AF23569A23569A2153
            97163D804D80C501398CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2560B130
            323C2F323D00398C386BAF205397235699205194163F811C448B7CAFF43868B4
            2255992152961842850C2B6C4E81C7013A8DFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF2560B131353E30353E003B8E3668AC194A8E18458811367708225E10
            307882B5FA3C6DBA143D7E153C7F1335791131785386CC013C8FFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF2560B132373F32373F003C903564AB255197315F
            A73D6DB7487AC8578AD974A7EC7CAFF484B7FC83B6FB7AADF26A9DE25E91D601
            3D91FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2560B1343841343841003D91
            6497DC70A3E87BAEF383B6FB88BBFF85B8FD83B6FB83B6FB78ACF26398E0497F
            CA3069B51C57A6013E92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2560B125
            60B12560B1003E935388D0437BC53C75C1316BB9215DAD124EA1054297034195
            0845990D4A9D134FA21854A71E5AAB235EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF0443963D6DAE5F87BC83A2CBA9BFDBCBD8EAED
            F2F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = CloseExecute
        end
        object btnCancelar: TSpeedButton
          Left = 227
          Top = 2
          Width = 88
          Height = 30
          Cursor = crHandPoint
          Caption = '&Cancelar'
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF3B46E23A44E2FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3A44E23B46E2FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3B46E2616BF9616BF93842E0FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3842E0616BF9
            616BF93B46E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3A44E15660F1737C
            FE7E87FE626CF93842E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF38
            42E0626CF97E87FE737CFE5660F13A44E1FFFFFFFFFFFFFFFFFFFFFFFF3842E0
            4C54EA6169F66972FC757FFE848DFE636DFA3842E0FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF3842E0636DFA848DFE757FFE6972FC6169F64C54EA3842E0FFFFFFFF
            FFFFFFFFFF3741DF464FE75961F1626BF86B74FE7882FE828CFE616BF93943E1
            FFFFFFFFFFFFFFFFFF3943E1616BF9828CFE7882FE6B74FE626BF85961F1464F
            E73741DFFFFFFFFFFFFFFFFFFFFFFFFF3741DF4851E85C64F3646CF96A73FD74
            7DFE7B85FE5D67F73B46E2FFFFFF3B46E25D67F77B85FE747DFE6A73FD646CF9
            5C64F34851E83741DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3741DF4851
            E85A62F2616AF7666FFA6D76FE717BFE6B74FE3B46E26B74FE717BFE6D76FE66
            6FFA616AF75A62F24851E83741DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF3741DF4750E75860F15D65F4616AF7646DF96770FB6770FB6770
            FB646DF9616AF75D65F45860F14750E73741DFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3640DE424AE34E55E9575FF05A62F2
            5C64F35C64F35C64F35A62F2575FF04E55E9424AE33640DEFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3640DE4E
            55E9575FF05A62F25C64F35C64F35C64F35A62F2575FF04E55E93640DEFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF3640DE575FF05A62F25C64F35C64F35C64F35A62F2575FF036
            40DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF3640DE4E55E9575FF05A62F25C64F35C64F35C64
            F35A62F2575FF04E55E93640DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3640DE424AE34E55E9575FF05A62F2
            5C64F35C64F35C64F35A62F2575FF04E55E9424AE33640DEFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3741DF4750E75860F15D
            65F4616AF7646DF96770FB6770FB6770FB646DF9616AF75D65F45860F14750E7
            3741DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3741DF4851
            E85A62F2616AF7666FFA6D76FE717BFE6B74FE3B46E26B74FE717BFE6D76FE66
            6FFA616AF75A62F24851E83741DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            3741DF4851E85C64F3646CF96A73FD747DFE7B85FE5D67F73B46E2FFFFFF3B46
            E25D67F77B85FE747DFE6A73FD646CF95C64F34851E83741DFFFFFFFFFFFFFFF
            FFFFFFFFFF3741DF464FE75961F1626BF86B74FE7882FE828CFE616BF93943E1
            FFFFFFFFFFFFFFFFFF3943E1616BF9828CFE7882FE6B74FE626BF85961F1464F
            E73741DFFFFFFFFFFFFFFFFFFF3842E04C54EA6169F66972FC757FFE848DFE63
            6DFA3842E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3842E0636DFA848DFE757FFE
            6972FC6169F64C54EA3842E0FFFFFFFFFFFFFFFFFFFFFFFF3A44E15660F1737C
            FE7E87FE626CF93842E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF38
            42E0626CF97E87FE737CFE5660F13A44E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF3B46E2616BF9616BF93842E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF3842E0616BF9616BF93B46E2FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF3B46E23A44E2FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3A44E23B46E2FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = btnCancelarClick
        end
      end
    end
    object tsPesquisar: TTabSheet
      Caption = 'Pesquisa'
      ImageIndex = 1
      object cbPesquisa: TComboBox
        Left = 6
        Top = 10
        Width = 83
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 0
        Text = 'ID'
        Items.Strings = (
          'ID'
          'Nome')
      end
      object edtCodigoFuncionario: TMaskEdit
        Left = 95
        Top = 10
        Width = 488
        Height = 21
        TabOrder = 1
        Text = ''
        OnKeyPress = edtCodigoFuncionarioKeyPress
      end
      object lbListaPesquisa: TListBox
        Left = 3
        Top = 36
        Width = 577
        Height = 293
        ItemHeight = 13
        TabOrder = 2
        OnDblClick = lbListaPesquisaDblClick
      end
    end
  end
  object CadastroActionList: TActionList
    Left = 528
    Top = 464
    object NovoAction: TAction
      Caption = '&Novo'
    end
    object SalvarAction: TAction
      Caption = '&Salvar'
    end
    object EditarAction: TAction
      Caption = '&Editar'
    end
    object ExcluirAction: TAction
      Caption = '&Excluir'
    end
    object PesquisarAction: TAction
      Caption = '&Pesquisar'
    end
    object SairAction: TAction
      Caption = 'Sai&r'
    end
  end
end
