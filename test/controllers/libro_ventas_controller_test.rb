require 'test_helper'

class LibroVentasControllerTest < ActionController::TestCase
  setup do
    @libro_venta = libro_ventas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:libro_ventas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create libro_venta" do
    assert_difference('LibroVenta.count') do
      post :create, libro_venta: { establecimiento_id: @libro_venta.establecimiento_id, mes: @libro_venta.mes, year: @libro_venta.year }
    end

    assert_redirected_to libro_venta_path(assigns(:libro_venta))
  end

  test "should show libro_venta" do
    get :show, id: @libro_venta
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @libro_venta
    assert_response :success
  end

  test "should update libro_venta" do
    patch :update, id: @libro_venta, libro_venta: { establecimiento_id: @libro_venta.establecimiento_id, mes: @libro_venta.mes, year: @libro_venta.year }
    assert_redirected_to libro_venta_path(assigns(:libro_venta))
  end

  test "should destroy libro_venta" do
    assert_difference('LibroVenta.count', -1) do
      delete :destroy, id: @libro_venta
    end

    assert_redirected_to libro_ventas_path
  end
end
