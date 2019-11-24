class CreateAssentoVoos < ActiveRecord::Migration[5.2]
  def change
    create_table :assento_voos do |t|
      t.references :voo, foreign_key: true
      t.references :assento, foreign_key: true
      t.references :passageiro, foreign_key: true

      t.timestamps
    end
  end
end
