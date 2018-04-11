class LibroVenta < ActiveRecord::Base
  belongs_to :establecimiento
  has_many :ventas
end
