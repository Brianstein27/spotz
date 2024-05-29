class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_spot, only: %i[show]

  def index
    @spots = Spot.all
  end

  def show
  end

  private

  def set_spot
    @spot = Spot.find(params[:id])
  end
end
