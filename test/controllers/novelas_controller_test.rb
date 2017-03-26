require 'test_helper'

class NovelasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @novela = novelas(:one)
  end

  test "should get index" do
    get novelas_url, as: :json
    assert_response :success
  end

  test "should create novela" do
    assert_difference('Novela.count') do
      post novelas_url, params: { novela: { author: @novela.author, description: @novela.description, name: @novela.name, tipo: @novela.tipo } }, as: :json
    end

    assert_response 201
  end

  test "should show novela" do
    get novela_url(@novela), as: :json
    assert_response :success
  end

  test "should update novela" do
    patch novela_url(@novela), params: { novela: { author: @novela.author, description: @novela.description, name: @novela.name, tipo: @novela.tipo } }, as: :json
    assert_response 200
  end

  test "should destroy novela" do
    assert_difference('Novela.count', -1) do
      delete novela_url(@novela), as: :json
    end

    assert_response 204
  end
end
