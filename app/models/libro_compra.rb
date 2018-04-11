class LibroCompra < ActiveRecord::Base
  belongs_to :establecimiento
  has_many :compras
end
