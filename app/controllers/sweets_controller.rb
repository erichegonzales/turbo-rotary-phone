class SweetsController < ApplicationController
  before_action :set_sweet, only: [:show, :update, :destroy]

  # GET /sweets
  def index
    @sweets = Sweet.all

    render json: @sweets
  end

  # GET /sweets/1
  def show
    render json: @sweet
  end

  # POST /sweets
  def create
    @sweet = Sweet.new(sweet_params)

    if @sweet.save
      render json: @sweet, status: :created, location: @sweet
    else
      render json: @sweet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sweets/1
  def update
    if @sweet.update(sweet_params)
      render json: @sweet
    else
      render json: @sweet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sweets/1
  def destroy
    @sweet.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sweet
      @sweet = Sweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sweet_params
      params.require(:sweet).permit(:name)
    end
end
