class CreateCompras < ActiveRecord::Migration
  def change
    create_table :compras do |t|
      t.string :documento
      t.integer :serie
      t.integer :numero
      t.integer :dia
      t.integer :proveedor_id
      t.decimal :base, precision: 10, scale: 2
      t.decimal :iva, precision: 10, scale: 2
      t.decimal :bienes, precision: 10, scale: 2
      t.decimal :servicios, precision: 10, scale: 2
      t.decimal :total, precision: 10, scale: 2
      t.references :libro_compra, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
