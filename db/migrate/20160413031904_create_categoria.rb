class CreateCategoria < ActiveRecord::Migration
  def change
    create_table :categoria do |t|
      t.string :nombre
      t.integer :orden
      t.string :foto_url

      t.timestamps null: false
    end
  end
end
