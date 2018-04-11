class Venta < ActiveRecord::Base
	before_validation :total
	before_validation :base_iva
	before_save :nombre_nit

	#Validaciones
	validates :documento , presence: true
	validates :serie, presence: true
	validates :numero, presence: true, numericality:true
	validates :dia, presence: true, numericality:true
	validates :total, numericality: { greater_than: 0, message:": debes ingresar cantidades validas en bienes y/o servicios" }

	#Asiosiaciones
	belongs_to :libro_venta


	def base_iva
		#if self.libro_v.establecimiento.contribuyente.t_contribuyente == "normal"
		suma = self.total
		self.base = (suma.to_f / 1.12).round(2)
		self.iva = (self.base.to_f * 0.12).round(2)
		#else
		#	self.base = 0.00
		#	self.iva = 0.00
		#end
	end
	def nombre_nit
		if self.nombre == "" && self.nit == ""
			self.nombre = nil
			self.nit = nil
		end
	end

	def total
		self.total = '%.2f' % (self.bienes.to_f + self.servicios.to_f)
	end
end
