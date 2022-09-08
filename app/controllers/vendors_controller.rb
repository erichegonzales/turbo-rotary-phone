class VendorsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    render json:  Vendor.all
  end

  def show
    vendor = find_vendor
    render json: vendor, serialization: VendorWithSweetsSerializer
  end

  private
    def find_vendor
      Vendor.find(params[:id])
    end

    def render_not_found_response
      render json: { error: "Vendor not found" }, status: :not_found
    end
end