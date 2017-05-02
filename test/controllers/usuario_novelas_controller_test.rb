require 'test_helper'

class UsuarioNovelasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @usuario_novela = usuario_novelas(:one)
  end

  test "should get index" do
    get usuario_novelas_url, as: :json
    assert_response :success
  end

  test "should create usuario_novela" do
    assert_difference('UsuarioNovela.count') do
      post usuario_novelas_url, params: { usuario_novela: { id_novela: @usuario_novela.id_novela, id_novela_capitulo: @usuario_novela.id_novela_capitulo, id_usuario: @usuario_novela.id_usuario } }, as: :json
    end

    assert_response 201
  end

  test "should show usuario_novela" do
    get usuario_novela_url(@usuario_novela), as: :json
    assert_response :success
  end

  test "should update usuario_novela" do
    patch usuario_novela_url(@usuario_novela), params: { usuario_novela: { id_novela: @usuario_novela.id_novela, id_novela_capitulo: @usuario_novela.id_novela_capitulo, id_usuario: @usuario_novela.id_usuario } }, as: :json
    assert_response 200
  end

  test "should destroy usuario_novela" do
    assert_difference('UsuarioNovela.count', -1) do
      delete usuario_novela_url(@usuario_novela), as: :json
    end

    assert_response 204
  end
end
