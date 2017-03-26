class NovelasController < ApplicationController
  before_action :set_novela, only: [:show, :update, :destroy]

  # GET /novelas
  def index
    @novelas = Novela.all

    render json: @novelas
  end

  # GET /novelas/1
  def show
    render json: @novela
  end

  # POST /novelas
  def create
    @novela = Novela.new(novela_params)

    if @novela.save
      render json: @novela, status: :created, location: @novela
    else
      render json: @novela.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /novelas/1
  def update
    if @novela.update(novela_params)
      render json: @novela
    else
      render json: @novela.errors, status: :unprocessable_entity
    end
  end

  # DELETE /novelas/1
  def destroy
    @novela.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_novela
      @novela = Novela.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def novela_params
      params.require(:novela).permit(:name, :description, :tipo, :author)
    end
end
