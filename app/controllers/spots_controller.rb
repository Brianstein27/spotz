class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show options filter_categories]
  before_action :set_spot, only: %i[show]

  def index
    if params[:query].present?
      if params[:category_ids].present?
        @spots = Spot.global_search(params[:query]).where(category_id: params[:category_ids])
      else
        @spots = Spot.global_search(params[:query])
      end
    elsif params[:category_ids].present?
      @spots = Spot.where(category_id: params[:category_ids])
    else
      @spots = Spot.all
    end

    @markers = @spots.geocoded.map do |spot|
      {
        latitude: spot.latitude,
        longitude: spot.longitude,
        marker_html: render_to_string(partial: "marker"),
        name: spot.name
      }
    end
  end

  def show
    @marker =
      [{
        latitude: @spot.latitude,
        longitude: @spot.longitude,
        marker_html: render_to_string(partial: "marker"),
        name: @spot.name
      }]
    @bookmarks = Bookmark.where(spot: @spot)
    @visits = Visit.where(spot: @spot)
    @events = Event.all
    links = Link.where(spot: @spot)
    @experiences = links.map(&:experience)
    @average_rating = average_rating

    @distance = @spot.distance_to([52.51,13.39])
    @short_distance = @distance.round(2)
  end

  def options
    @visit = Visit.where(user: current_user, spot: params[:spot_id]).first
    @bookmark = Bookmark.where(user: current_user, spot: params[:spot_id]).first
    @review = Review.where(user: current_user, reviewable: params[:spot_id]).first if params[:spot_id]
    @review = Review.where(user: current_user, reviewable: params[:experience_id]).first if params[:experience_id]
  end

  def filter_categories
    @categories = Category.all
  end

  private

  def average_rating
    rating = 0
    @spot.reviews.each { |review| rating += review.rating }
    rating = rating.to_f / @spot.reviews.count
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end
end
