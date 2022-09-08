class VendorSweetsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def create
    vendor_sweet = VendorSweet.create!(vendor_sweet_params)
    render json: vendor_sweet, status: :created
  end

  def destroy
    vendor_sweet = find_vendor_sweet
    vendor_sweet.destroy
    head :no_content
  end

  private
    def find_vendor_sweet
      VendorSweet.find(params[:id])
    end

    def vendor_sweet_params
      params.require(:vendor_sweet).permit(:vendor_id, :sweet_id, :price)
    end

    def render_not_found_response
      render json: { error: "VendorSweet not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
      render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
