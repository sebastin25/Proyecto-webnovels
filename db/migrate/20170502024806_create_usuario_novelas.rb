class CreateUsuarioNovelas < ActiveRecord::Migration[5.0]
  def change
    create_table :usuario_novelas do |t|
      t.references :novela, foreign_key: true
      t.references :user, foreign_key: true
      t.references :capitulo, foreign_key: true
      t.timestamps

    end
      add_index :usuario_novelas, [:user, :novela], unique: true
  end
end
