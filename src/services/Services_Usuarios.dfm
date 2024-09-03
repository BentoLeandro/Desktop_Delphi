inherited ServicesUsuarios: TServicesUsuarios
  Height = 480
  Width = 640
  inherited mtPesquisa: TFDMemTable
    Left = 141
    Top = 166
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
    object mtPesquisalogin: TWideStringField
      FieldName = 'login'
      Origin = '"login"'
      Size = 30
    end
    object mtPesquisastatus: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'status'
      Origin = 'status'
      OnGetText = mtPesquisastatusGetText
    end
    object mtPesquisatelefone: TWideStringField
      FieldName = 'telefone'
      Origin = 'telefone'
    end
    object mtPesquisasexo: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'sexo'
      Origin = 'sexo'
      OnGetText = mtPesquisasexoGetText
    end
  end
  inherited mtCadastro: TFDMemTable
    AfterInsert = mtCadastroAfterInsert
    Left = 307
    Top = 166
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
    object mtCadastrologin: TWideStringField
      FieldName = 'login'
      Origin = '"login"'
      Size = 30
    end
    object mtCadastrosenha: TWideStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 256
    end
    object mtCadastrostatus: TSmallintField
      FieldName = 'status'
      Origin = 'status'
    end
    object mtCadastrotelefone: TWideStringField
      FieldName = 'telefone'
      Origin = 'telefone'
    end
    object mtCadastrosexo: TSmallintField
      FieldName = 'sexo'
      Origin = 'sexo'
    end
  end
end
