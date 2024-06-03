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
    @bookmark = Bookmark.where(user: current_user, spot: @spot).first
    @events = Event.all
    @experiences = Experience.all
  end

  def options
    @visit = Visit.where(user: current_user, spot: params[:spot_id]).first
    @bookmark = Bookmark.where(user: current_user, spot: params[:spot_id]).first
    @review = Review.where(user: current_user, reviewable: params[:spot_id]).first if params[:spot_id]
    @review = Review.where(user: current_user, reviewable: params[:experience_id]).first if params[:experience_id]
  end

  private

  def set_spot
    @spot = Spot.find(params[:id])
  end
end
