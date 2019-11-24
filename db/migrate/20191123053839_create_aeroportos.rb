class CreateAeroportos < ActiveRecord::Migration[5.2]
  def change
    create_table :aeroportos do |t|
      t.integer :nome
      t.integer :sigla
      t.integer :cidade

      t.timestamps
    end
  end
end
