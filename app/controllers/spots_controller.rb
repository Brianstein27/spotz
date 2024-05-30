class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show options]
  before_action :set_spot, only: %i[show]

  def index
    @spots = Spot.all
    return unless params[:query].present?

    subquery = "name @@ :query OR subtitle @@ :query OR category @@ :query OR description @@ :query OR address @@ :query"
    # if you wanna search through associations, you need to JOIN, see search lecture .4
    @spots = @spots.where(subquery, query: "%#{params[:query]}%")
  end

  def show
    @markers =
      [{
        latitude: @spot.latitude,
        longitude: @spot.longitude,
        marker_html: render_to_string(partial: "marker")
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

  def delete_visit
    @spot = Spot.find(params[:spot_id])
    @visit = Visit.where(user: current_user, spot: @spot).first
    @visit.delete

    redirect_to @spot, notice: "spot was removed from visited list"
  end

  private

  def set_spot
    @spot = Spot.find(params[:id])
  end
end
