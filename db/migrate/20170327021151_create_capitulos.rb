class CreateCapitulos < ActiveRecord::Migration[5.0]
  def change
    create_table :capitulos do |t|
      t.integer :numero_capitulo
      t.string :nombre_capitulo
      t.string :link
      t.references :novela, foreign_key: true

      t.timestamps
    end
  end
end
