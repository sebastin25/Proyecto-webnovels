class UsuarioNovelasController < ApplicationController
  before_action :set_usuario_novela, only: [:show]
  before_action :authenticate_user

  # GET /usuario_novelas
  def index
    @usuario_novelas = UsuarioNovela.find_by_sql(["SELECT * FROM usuario_novelas WHERE user_id = ?", params[:user_id]])
    render json: @usuario_novelas
  end

  # GET /usuario_novelas/1
  def show
    render json: @usuario_novela
  end

  # POST /usuario_novelas
  def create
    @usuario_novela = UsuarioNovela.new(usuario_novela_params)

    if @usuario_novela.save
      render json: @usuario_novela, status: :created, location: @usuario_novela
    else
      render json: @usuario_novela.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /usuario_novelas/1
  def update
    @usuario_novela = UsuarioNovela.find(params[:id])
    if @usuario_novela.update(usuario_novela_params)
      render json: @usuario_novela
    else
      render json: @usuario_novela.errors, status: :unprocessable_entity
    end
  end

  # DELETE /usuario_novelas/1
  def destroy
    #@usuario_novela = UsuarioNovela.find_by_sql(["SELECT * FROM usuario_novelas WHERE user_id = ? and id = ?", params[:user_id], :id]) 
      
    @usuario_novela = UsuarioNovela.find(params[:id])  
    @usuario_novela.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario_novela
      @usuario_novela = UsuarioNovela.find_by_sql(["SELECT * FROM usuario_novelas WHERE user_id = ? and novela_id = ?", params[:user_id], :novela_id])
    end

    # Only allow a trusted parameter "white list" through.
    def usuario_novela_params
      params.require(:usuario_novela).permit(:novela_id, :user_id, :capitulo_id)
    end
end
