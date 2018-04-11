class LibroVentasController < ApplicationController
  before_action :set_libro_venta, only: [:show, :edit, :update, :destroy]
  before_action :set_ventas

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

    def set_ventas
      # @iva = @libro_venta.ventas.sum(:iva)
      # @base = @libro_venta.ventas.sum(:base)
      # @bienes = (@libro_venta.ventas.sum(:bienes).to_f / 1.12).round(2)
      # servicios = (@libro_venta.ventas.sum(:servicios).to_f / 1.12).round(2)
      @ventas_por_dia = @libro_venta.ventas.order(:dia).group(:dia).sum(:base)
      dias = @libro_venta.ventas.order(:dia).group(:dia).count()

      @ventas = []

      dias.each do |dia|
        numero_dia = dia[0]
        cantidad_ventas = dia[1]
        if cantidad_ventas == 1
          venta_unica = @libro_venta.ventas.find_by(dia: numero_dia).as_json
          venta_unica["min"] = venta_unica["numero"]
          venta_unica["max"] = venta_unica["numero"]
          @ventas.push venta_unica
        else
          series = @libro_venta.ventas(dia: dia[0]).group(:serie).count()
          series.each do |serie|
            resumen_dia_ventas = {}
            resumen_dia_ventas['base']  = @libro_venta.ventas(dia: numero_dia, serie: serie).sum(:base)
            resumen_dia_ventas['bienes'] = @libro_venta.ventas(dia: numero_dia, serie: serie).sum(:bienes)
            resumen_dia_ventas['servicios'] = @libro_venta.ventas(dia: numero_dia, serie: serie).sum(:servicios)
            resumen_dia_ventas['documento'] = 'FC'
            resumen_dia_ventas['numero']  = 'Pendiente'
            resumen_dia_ventas['dia'] = numero_dia
            resumen_dia_ventas['mes'] = current_usuario.config.mes
            resumen_dia_ventas['year'] = current_usuario.config.year
            resumen_dia_ventas['nit'] = 'C/F'
            resumen_dia_ventas['nombre'] = "Clientes Varios"
            resumen_dia_ventas['min'] = @libro_venta.ventas(dia: numero_dia, serie: serie).minimum(:numero)
            resumen_dia_ventas['max'] = @libro_venta.ventas(dia: numero_dia, serie: serie).maximum(:numero)
            resumen_dia_ventas['serie'] = serie[0]

            @ventas.push resumen_dia_ventas.as_json
          end
        end
      end
      return @ventas
      
    end
  end
