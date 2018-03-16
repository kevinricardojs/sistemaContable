require 'test_helper'

class LibroComprasControllerTest < ActionController::TestCase
  setup do
    @libro_compra = libro_compras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:libro_compras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create libro_compra" do
    assert_difference('LibroCompra.count') do
      post :create, libro_compra: { establecimiento_id: @libro_compra.establecimiento_id, mes: @libro_compra.mes, year: @libro_compra.year }
    end

    assert_redirected_to libro_compra_path(assigns(:libro_compra))
  end

  test "should show libro_compra" do
    get :show, id: @libro_compra
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @libro_compra
    assert_response :success
  end

  test "should update libro_compra" do
    patch :update, id: @libro_compra, libro_compra: { establecimiento_id: @libro_compra.establecimiento_id, mes: @libro_compra.mes, year: @libro_compra.year }
    assert_redirected_to libro_compra_path(assigns(:libro_compra))
  end

  test "should destroy libro_compra" do
    assert_difference('LibroCompra.count', -1) do
      delete :destroy, id: @libro_compra
    end

    assert_redirected_to libro_compras_path
  end
end
