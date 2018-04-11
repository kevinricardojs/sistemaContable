class LibroComprasController < ApplicationController
  before_action :set_libro_compra, only: [:show, :edit, :update, :destroy]
  before_action :set_compras

  # GET /libro_compras
  # GET /libro_compras.json
  def index
    @libro_compras = LibroCompra.all
  end

  # GET /libro_compras/1
  # GET /libro_compras/1.json
  def show
  end

  # GET /libro_compras/new
  def new
    @libro_compra = LibroCompra.new
  end

  # GET /libro_compras/1/edit
  def edit
  end

  # POST /libro_compras
  # POST /libro_compras.json
  def create
    @libro_compra = LibroCompra.new(libro_compra_params)

    respond_to do |format|
      if @libro_compra.save
        format.html { redirect_to @libro_compra, notice: 'Libro compra was successfully created.' }
        format.json { render :show, status: :created, location: @libro_compra }
      else
        format.html { render :new }
        format.json { render json: @libro_compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /libro_compras/1
  # PATCH/PUT /libro_compras/1.json
  def update
    respond_to do |format|
      if @libro_compra.update(libro_compra_params)
        format.html { redirect_to @libro_compra, notice: 'Libro compra was successfully updated.' }
        format.json { render :show, status: :ok, location: @libro_compra }
      else
        format.html { render :edit }
        format.json { render json: @libro_compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /libro_compras/1
  # DELETE /libro_compras/1.json
  def destroy
    @libro_compra.destroy
    respond_to do |format|
      format.html { redirect_to libro_compras_url, notice: 'Libro compra was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_libro_compra
      @libro_compra = LibroCompra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def libro_compra_params
      params.require(:libro_compra).permit(:establecimiento_id, :mes, :year)
    end

    def set_compras
      @iva = @libro_compra.compras.sum(:iva)
      @base = @libro_compra.compras.sum(:base)
      @compras_por_dia = @libro_compra.compras.order(:dia)
      @total = @base + @iva
      @total_cuentas = @libro_compra.compras.count

    end
  end
