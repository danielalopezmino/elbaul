class CreateCategoriaProductos < ActiveRecord::Migration
  def change
    create_table :categoria_productos do |t|
      t.references :categorium, index: true, foreign_key: true
      t.references :producto, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
