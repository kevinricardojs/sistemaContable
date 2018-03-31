class LibroVentasController < ApplicationController
  before_action :set_libro_venta, only: [:show, :edit, :update, :destroy]

  # GET /libro_ventas
  # GET /libro_ventas.json
  def index
    @libro_ventas = LibroVenta.all
  end

  # GET /libro_ventas/1
  # GET /libro_ventas/1.json
  def show
  end

  # GET /libro_ventas/new
  def new
    @libro_venta = LibroVenta.new
  end

  # GET /libro_ventas/1/edit
  def edit
  end

  # POST /libro_ventas
  # POST /libro_ventas.json
  def create
    @libro_venta = LibroVenta.new(libro_venta_params)

    respond_to do |format|
      if @libro_venta.save
        format.html { redirect_to @libro_venta, notice: 'Libro venta was successfully created.' }
        format.json { render :show, status: :created, location: @libro_venta }
      else
        format.html { render :new }
        format.json { render json: @libro_venta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /libro_ventas/1
  # PATCH/PUT /libro_ventas/1.json
  def update
    respond_to do |format|
      if @libro_venta.update(libro_venta_params)
        format.html { redirect_to @libro_venta, notice: 'Libro venta was successfully updated.' }
        format.json { render :show, status: :ok, location: @libro_venta }
      else
        format.html { render :edit }
        format.json { render json: @libro_venta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /libro_ventas/1
  # DELETE /libro_ventas/1.json
  def destroy
    @libro_venta.destroy
    respond_to do |format|
      format.html { redirect_to libro_ventas_url, notice: 'Libro venta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_libro_venta
      @libro_venta = LibroVenta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def libro_venta_params
      params.require(:libro_venta).permit(:establecimiento_id, :mes, :year)
    end
end
