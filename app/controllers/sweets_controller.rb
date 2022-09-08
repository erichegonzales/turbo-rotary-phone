class SweetsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    render json: Sweet.all
  end

  def show
    sweet = find_sweet
    render json: sweet
  end

  private
    def find_sweet
      Sweet.find(params[:id])
    end

    def render_not_found_response
      render json: { error: "Sweet not found" }, status: :not_found
    end
end
