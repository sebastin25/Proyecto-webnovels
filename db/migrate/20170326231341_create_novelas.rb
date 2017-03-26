class CreateNovelas < ActiveRecord::Migration[5.0]
  def change
    create_table :novelas do |t|
      t.string :name
      t.text :description
      t.string :tipo
      t.string :author

      t.timestamps
    end
  end
end
