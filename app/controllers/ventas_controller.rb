class VentasController < ApplicationController
  before_action :set_venta, only: [:edit, :update, :destroy]
  before_action :l_ventas_valid

  # GET /ventas
  # GET /ventas.json
  def index
    @ventas = Venta.all
  end

  # GET /ventas/1
  # GET /ventas/1.json
  def show
  end

  # GET /ventas/new
  def new
    @venta = Venta.new
  end

  # GET /ventas/1/edit
  def edit
  end

  # POST /ventas
  # POST /ventas.json
  def create
    @venta = Venta.new(venta_params)
    @venta.libro_venta_id = @l_ventas.id

    respond_to do |format|
      if @venta.save
        format.html { redirect_to new_venta_path, notice: 'Venta was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /ventas/1
  # PATCH/PUT /ventas/1.json
  def update
    respond_to do |format|
      if @venta.update(venta_params)
        format.html { redirect_to @l_ventas, notice: 'Venta was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /ventas/1
  # DELETE /ventas/1.json
  def destroy
    @venta.destroy
    respond_to do |format|
      format.html { redirect_to new_venta_path, notice: 'Venta was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venta
      @venta = Venta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venta_params
      params.require(:venta).permit(:documento, :serie, :numero, :dia, :nit, :nombre, :bienes, :servicios, :base, :iva, :total, :libr_venta_id)
    end

    def l_ventas_valid
      if @l_ventas == nil
        redirect_to :root, alert: "No has completado correctamente la configuración para añadir Ventas"
      end
    end
end
