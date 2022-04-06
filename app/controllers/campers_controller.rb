class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    
    def index
        render json: Camper.all, status: 200
    end

    def show
        camper=Camper.find(params[:id])
        render json: camper,include: [:activities], status: 200
    end

    def create
        render json: Camper.create!(camper_params), status: 201
    end

    private

    def camper_params
        params.permit(:name, :age)
    end

    def render_not_found
        render json: {error: "Camper not found"}, status: 404
    end

    def render_unprocessable_entity invalid
        render json: {errors: invalid.record.errors.full_messages}, status: 422
    end
end
