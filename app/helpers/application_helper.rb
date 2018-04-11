module ApplicationHelper

	def contribuyente
		if current_usuario.config.contribuyente_id == nil
			"Seleccione un Contribuyente"
		else
			Contribuyente.find(current_usuario.config.contribuyente_id).nombre
		end
	end
	def establecimiento
		if current_usuario.config.establecimiento_id == nil
			"Seleccione un Establecimiento"
		else
			Establecimiento.find(current_usuario.config.establecimiento_id).nombre
		end
	end

	def mes
		if current_usuario.config.mes == nil
			"Mes"
		else
			meses = ["Mes", "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"]
			meses[current_usuario.config.mes]
		end
	end

	def max_mes
		Date.new(current_usuario.config.year, current_usuario.config.mes, -1).to_s.split("-")[2]
	end
end
