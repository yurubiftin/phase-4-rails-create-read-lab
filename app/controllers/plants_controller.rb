class PlantsController < ApplicationController
    def index
        plant = Plant.all 
        render json: plant, except: [:created_at, :updated_at]
    end

    def show
        plant = Plant.find_by(id: params[:id])
        if plant
            render json: plant, except: [:created_at, :updated_at]
        else 
            render json: {error: "Plant not found"} , status: 404
        end
    end

    def create
        plant = Plant.create(plant_params)
        render json: plant, status: 201

    end
    private

    def plant_params
        params.permit(:name, :image, :price)
    end
end