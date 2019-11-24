class CreatePassageiros < ActiveRecord::Migration[5.2]
  def change
    create_table :passageiros do |t|
      t.string :nome_completo
      t.string :cpf
      t.string :idade
      t.string :cod_reserva
      t.references :voo, foreign_key: true

      t.timestamps
    end
  end
end
