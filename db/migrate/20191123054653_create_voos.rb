class CreateVoos < ActiveRecord::Migration[5.2]
  def change
    create_table :voos do |t|
      t.integer :numero
      t.integer :qtd_escalas
      t.integer :origem
      t.integer :destino
      t.date :data_saida
      t.references :aeronave, foreign_key: true

      t.timestamps
    end
  end
end
