class Contribuyente < ActiveRecord::Base

	# Validaciones
	validates :nit, presence: true, uniqueness: {message: " ya fue registrado"}
	validates :tipo_contribuyente, presence: {message: " debe ser especificado"}
	validates :nombre, presence: true
	validates :telefono, presence: true
	validates :departamento, presence: true
	validates :municipio, presence: true
	validates :colonia, presence: true
	validates :calle, presence: true
	validates :no_casa, presence: true
	validates :zona, presence: true


end
