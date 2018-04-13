class Establecimiento < ActiveRecord::Base
  belongs_to :contribuyente
  has_many :libro_compras
  has_many :libro_ventas

  validates :contribuyente_id, presence: {message: " debe ser seleccionado"}
	validates :nombre, presence: true
	validates :telefono , presence: true, length: {is: 8 , message:" tiene un minimo de 8 caracteres"},
	numericality:{only_integer: true , message:" solo debe contener numeros"}
	validates :departamento, presence: true
	validates :municipio, presence: true
	validates :colonia, presence: true
	validates :calle, presence: true
	validates :zona, presence: true
end
