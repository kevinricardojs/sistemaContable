class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_usuario!
  before_action :buscar_o_crear_config
  before_action :l_compras
  before_action :l_ventas

  def buscar_o_crear_config
  	if usuario_signed_in?
  		current_usuario.config = Config.find_or_create_by(usuario_id: current_usuario.id)
  	end
  end

  def l_compras
    if usuario_signed_in?
      config = current_usuario.config
      if config.establecimiento_id != nil && config.mes != nil && config.year != nil && config.mes != 0 && config.year != 0
        @l_compras = LibroCompra.find_or_create_by(establecimiento_id: config.establecimiento_id, mes: config.mes, year: config.year)
      else
        @l_compras = nil
      end
    end
  end


  def l_ventas
    if usuario_signed_in?
      config = current_usuario.config
      if config.establecimiento_id != nil && config.mes != nil && config.year != nil && config.mes != 0 && config.year != 0
        @l_ventas = LibroVenta.find_or_create_by(establecimiento_id: config.establecimiento_id, mes: config.mes, year: config.year)
      else
        @l_ventas = nil
      end
    end
  end
end
