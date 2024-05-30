class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show options]
  before_action :set_spot, only: %i[show]

  def index
    @spots = Spot.all
  end

  def show
    @markers =
      [{
        latitude: @spot.latitude,
        longitude: @spot.longitude
      }]
  end

  def options
    @visit = Visit.where(user: current_user, spot: params[:spot_id]).first
  end

  def create_visit
    @visit = Visit.new
    @spot = Spot.find(params[:spot_id])
    @visit.user = current_user
    @visit.spot = @spot

    redirect_to @spot, notice: "spot was added to visited" if @visit.save
  end

  def destroy_visit
    raise

    redirect_to @spot
  end

  private

  def set_spot
    @spot = Spot.find(params[:id])
  end
end
