class Proveedor < ActiveRecord::Base
	has_many :compras

	validates :nombre, presence: { message: " es requerido!" }
	validates :nit, presence: { message: " es requerido!" }
end
