class CreateAeronaves < ActiveRecord::Migration[5.2]
  def change
    create_table :aeronaves do |t|
      t.integer :modelo
      t.integer :capacidade
      t.integer :prefixo

      t.timestamps
    end
  end
end
