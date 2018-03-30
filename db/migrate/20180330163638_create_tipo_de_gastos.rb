class CreateTipoDeGastos < ActiveRecord::Migration
  def change
    create_table :tipo_de_gastos do |t|
      t.string :nombre

      t.timestamps null: false
    end
    add_index :tipo_de_gastos, :nombre, unique: true
  end
end
