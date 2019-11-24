class CreateAssentos < ActiveRecord::Migration[5.2]
  def change
    create_table :assentos do |t|
      t.integer :cod_assento
      t.references :aeronave, foreign_key: true

      t.timestamps
    end
  end
end
