require 'test_helper'

class ComprasControllerTest < ActionController::TestCase
  setup do
    @compra = compras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:compras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create compra" do
    assert_difference('Compra.count') do
      post :create, compra: { base: @compra.base, bienes: @compra.bienes, decimal: @compra.decimal, dia: @compra.dia, documento: @compra.documento, iva: @compra.iva, libro_compras_id: @compra.libro_compras_id, numero: @compra.numero, proveedor_id: @compra.proveedor_id, serie: @compra.serie, servicios: @compra.servicios, tipo_de_gasto_id: @compra.tipo_de_gasto_id, total: @compra.total }
    end

    assert_redirected_to compra_path(assigns(:compra))
  end

  test "should show compra" do
    get :show, id: @compra
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @compra
    assert_response :success
  end

  test "should update compra" do
    patch :update, id: @compra, compra: { base: @compra.base, bienes: @compra.bienes, decimal: @compra.decimal, dia: @compra.dia, documento: @compra.documento, iva: @compra.iva, libro_compras_id: @compra.libro_compras_id, numero: @compra.numero, proveedor_id: @compra.proveedor_id, serie: @compra.serie, servicios: @compra.servicios, tipo_de_gasto_id: @compra.tipo_de_gasto_id, total: @compra.total }
    assert_redirected_to compra_path(assigns(:compra))
  end

  test "should destroy compra" do
    assert_difference('Compra.count', -1) do
      delete :destroy, id: @compra
    end

    assert_redirected_to compras_path
  end
end
