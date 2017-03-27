class CapitulosController < ApplicationController
  before_action :set_capitulo, only: [:show, :update, :destroy]



  # GET novelas/:novela_id/capitulos
  def index
    novela = Novela.find(params[:novela_id])
    @capitulos = Capitulo.where(novela_id: novela)

    render json: @capitulos
  end

  # GET novelas/:novela_id/capitulos/1
  def show
    novela = Novela.find(params[:novela_id])
    @capitulos = Capitulo.where(novela_id: novela)
    render json: @capitulo
  end

  # POST /capitulos
  def create
    @capitulo = Capitulo.new(capitulo_params)

    if @capitulo.save
      render json: @capitulo, status: :created, location: @capitulo
    else
      render json: @capitulo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /capitulos/1
  def update
    if @capitulo.update(capitulo_params)
      render json: @capitulo
    else
      render json: @capitulo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /capitulos/1
  def destroy
    @capitulo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_capitulo
      novela = Novela.find(params[:novela_id])
      @capitulo = Capitulo.where(novela_id: novela).where(numero_capitulo: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def capitulo_params
      params.require(:capitulo).permit(:numero_capitulo, :nombre_capitulo, :link, :novela_id)
    end
end
