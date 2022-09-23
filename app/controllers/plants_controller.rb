class PlantsController < ApplicationController
  def index
    render json: Plant.all, except: [:created_at, :updated_at]
  end

  def show
    plant = Plant.find_by(id: params[:id])
    if Plant
      render json: plant, status: :found
    else
      render json: {error: "Plant not found"}
    end
  end

  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  private

  def plant_params
    params.permit(:name, :image, :price)
  end
end
