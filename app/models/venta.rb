class Venta < ActiveRecord::Base
	before_validation :base_iva
	before_save :nombre_nit
  belongs_to :libro_venta


  def base_iva
		#if self.libro_v.establecimiento.contribuyente.t_contribuyente == "normal"
			suma = self.bienes.to_f + self.servicios.to_f
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
