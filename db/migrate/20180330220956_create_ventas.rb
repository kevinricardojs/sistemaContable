class CreateVentas < ActiveRecord::Migration
  def change
    create_table :ventas do |t|
      t.string :documento
      t.string :serie
      t.integer :numero
      t.integer :dia
      t.string :nit, default: "C/F"
      t.string :nombre, default: "Clientes Varios"
      t.decimal :bienes, precision: 10, scale: 2
      t.decimal :servicios, precision: 10, scale: 2
      t.decimal :base, precision: 10, scale: 2
      t.decimal :iva, precision: 10, scale: 2
      t.decimal :total, precision: 10, scale: 2

      t.timestamps null: false
    end
  end
end
