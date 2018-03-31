class AddLibroVentaToVenta < ActiveRecord::Migration
  def change
    add_reference :ventas, :libro_venta, index: true, foreign_key: true
  end
end
