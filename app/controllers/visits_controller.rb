class VisitsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @spot = Spot.find(params[:spot_id])
    @visit = Visit.new
  end

  def create
    @user = User.find(params[:user_id])
    @spot = Spot.find(params[:spot_id])
    @visit = Visit.new(visit_params)
  end

  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy
  end

  private

  def visit_params
    params.require(:visit).permit(:spot_id, :user_id)
  end
end
