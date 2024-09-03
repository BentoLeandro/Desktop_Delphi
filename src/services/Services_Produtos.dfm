inherited ServicesProdutos: TServicesProdutos
  PixelsPerInch = 120
  inherited mtPesquisa: TFDMemTable
    Left = 220
    Top = 260
    object mtPesquisaid: TLargeintField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object mtPesquisanome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
    object mtPesquisavalor: TFMTBCDField
      FieldName = 'valor'
      Origin = 'valor'
      DisplayFormat = 'R$ ,0.00;'
      Precision = 20
      Size = 4
    end
    object mtPesquisastatus: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'status'
      Origin = 'status'
      OnGetText = mtPesquisastatusGetText
    end
    object mtPesquisaestoque: TFMTBCDField
      FieldName = 'estoque'
      Origin = 'estoque'
      Precision = 20
      Size = 4
    end
  end
  inherited mtCadastro: TFDMemTable
    AfterInsert = mtCadastroAfterInsert
    Left = 480
    Top = 260
    object mtCadastroid: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object mtCadastronome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
    object mtCadastrovalor: TFMTBCDField
      FieldName = 'valor'
      Origin = 'valor'
      DisplayFormat = 'R$ ,0.00;'
      EditFormat = ',0.00;'
      Precision = 20
      Size = 4
    end
    object mtCadastrostatus: TSmallintField
      FieldName = 'status'
      Origin = 'status'
    end
    object mtCadastroestoque: TFMTBCDField
      FieldName = 'estoque'
      Origin = 'estoque'
      Precision = 20
      Size = 4
    end
  end
end
