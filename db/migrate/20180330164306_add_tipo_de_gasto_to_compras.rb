class AddTipoDeGastoToCompras < ActiveRecord::Migration
  def change
    add_reference :compras, :tipo_de_gasto, index: true, foreign_key: true
  end
end
