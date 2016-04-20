class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.date :fecha
      t.string :nombre
      t.string :email
      t.string :telefono
      t.decimal :descuento
      t.decimal :costo_entrega
      t.string :nombre_entrega
      t.text :direccion_entrega
      t.date :fecha_entrega
      t.text :items
      t.string :estado

      t.timestamps null: false
    end
  end
end
