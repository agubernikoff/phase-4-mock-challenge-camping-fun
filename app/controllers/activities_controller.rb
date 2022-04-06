class ActivitiesController < ApplicationController
  
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  
  def index
    render json: Activity.all, status: 200
  end

  def destroy
    activity= Activity.find(params[:id])
    # activity.signups.destroy_all
    activity.destroy!
  end
  
  private

  def render_not_found
    render json: {error: "Activity not found"}, status: 404
end
end
