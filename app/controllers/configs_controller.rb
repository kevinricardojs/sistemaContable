class ConfigsController < ApplicationController
	before_action :set_config

	def update
      if @config.update(config_params)
        	redirect_to root_path
      else
     			redirect_to root_path
      end
	end

	private

	def set_config
		@config = Config.find(params[:id])
	end

	def config_params
		params.require(:config).permit(:contribuyente_id, :establecimiento_id, :mes, :year)
	end

end