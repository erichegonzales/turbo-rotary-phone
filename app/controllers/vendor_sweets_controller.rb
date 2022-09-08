class VendorSweetsController < ApplicationController
  before_action :set_vendor_sweet, only: [:show, :update, :destroy]

  # GET /vendor_sweets
  def index
    @vendor_sweets = VendorSweet.all

    render json: @vendor_sweets
  end

  # GET /vendor_sweets/1
  def show
    render json: @vendor_sweet
  end

  # POST /vendor_sweets
  def create
    @vendor_sweet = VendorSweet.new(vendor_sweet_params)

    if @vendor_sweet.save
      render json: @vendor_sweet, status: :created, location: @vendor_sweet
    else
      render json: @vendor_sweet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vendor_sweets/1
  def update
    if @vendor_sweet.update(vendor_sweet_params)
      render json: @vendor_sweet
    else
      render json: @vendor_sweet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vendor_sweets/1
  def destroy
    @vendor_sweet.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor_sweet
      @vendor_sweet = VendorSweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vendor_sweet_params
      params.require(:vendor_sweet).permit(:vendor_id, :sweet_id, :price)
    end
end
