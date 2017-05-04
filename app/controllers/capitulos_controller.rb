class CapitulosController < ApplicationController
  before_action :set_capitulo, only: [:update, :destroy]

  # GET /novelas/:novela_id/capitulos
  def index
    @capitulos = Capitulo.find_by_sql(["SELECT * FROM capitulos WHERE novela_id = ?", params[:novela_id]])

    render json: @capitulos
  end

  # GET /novelas/:novela_id/capitulos/1
  def show
    @capitulo = Capitulo.find_by_sql(["SELECT * FROM capitulos WHERE novela_id = ? and id = ?", params[:novela_id], params[:id]])
    render json: @capitulo
  end

  # POST /novelas/:novela_id/capitulos
  def create
    @capitulo = Capitulo.new(capitulo_params)

    if @capitulo.save
      render json: @capitulo, status: :created
    else
      render json: @capitulo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /novelas/:novela_id/capitulos/1
  def update
    if @capitulo.update(capitulo_params)
      render json: @capitulo
    else
      render json: @capitulo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /novelas/:novela_id/capitulos/1
  def destroy
    @capitulo.destroy_all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_capitulo
    novela = Novela.find(params[:novela_id])
    @capitulo = Capitulo.where(novela_id: novela).where(id:
                                 params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def capitulo_params
    params.require(:capitulo).permit(:numero_capitulo, :nombre_capitulo,
                                     :link, :novela_id)
  end
end
