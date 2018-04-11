class ComprasController < ApplicationController
  before_action :set_compra, only: [:edit, :update, :destroy]
  before_action :l_compras_valid

  # GET /compras
  # GET /compras.json
  def index
    @compras = Compra.all
  end

  # GET /compras/1
  # GET /compras/1.json
  def show
  end

  # GET /compras/new
  def new
    @compra = Compra.new
  end

  # GET /compras/1/edit
  def edit
  end

  # POST /compras
  # POST /compras.json
  def create
    @compra = Compra.new(compra_params)
    @compra.libro_compra_id = @l_compras.id
    respond_to do |format|
      if @compra.save
        format.html { redirect_to new_compra_path, notice: 'Compra was successfully created.' }
        else
        format.html { render :new }
        format.json { render json: @compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /compras/1
  # PATCH/PUT /compras/1.json
  def update
    respond_to do |format|
      if @compra.update(compra_params)
        format.html { redirect_to @l_compras, notice: 'Compra was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compras/1
  # DELETE /compras/1.json
  def destroy
    @compra.destroy
    respond_to do |format|
      format.html { redirect_to @l_compras, notice: 'Compra was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compra
      @compra = Compra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compra_params
      params.require(:compra).permit(:documento, :serie, :numero, :dia, :proveedor_nit, :proveedor_nombre  , :base, :iva, :bienes, :servicios, :total, :tipo_de_gasto, :libro_compra_id)
    end

    def l_compras_valid
      if @l_compras == nil
        redirect_to :root, alert: "No has completado correctamente la configuración para añadir Compras"
      end
    end
end
