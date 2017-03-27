require 'test_helper'

class CapitulosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @capitulo = capitulos(:one)
  end

  test "should get index" do
    get capitulos_url, as: :json
    assert_response :success
  end

  test "should create capitulo" do
    assert_difference('Capitulo.count') do
      post capitulos_url, params: { capitulo: { link: @capitulo.link, nombre_capitulo: @capitulo.nombre_capitulo, novela_id: @capitulo.novela_id, numero_capitulo: @capitulo.numero_capitulo } }, as: :json
    end

    assert_response 201
  end

  test "should show capitulo" do
    get capitulo_url(@capitulo), as: :json
    assert_response :success
  end

  test "should update capitulo" do
    patch capitulo_url(@capitulo), params: { capitulo: { link: @capitulo.link, nombre_capitulo: @capitulo.nombre_capitulo, novela_id: @capitulo.novela_id, numero_capitulo: @capitulo.numero_capitulo } }, as: :json
    assert_response 200
  end

  test "should destroy capitulo" do
    assert_difference('Capitulo.count', -1) do
      delete capitulo_url(@capitulo), as: :json
    end

    assert_response 204
  end
end
