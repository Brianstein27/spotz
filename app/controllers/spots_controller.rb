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
      @spots = Spot.global_search(params[:category_ids])
    else
      @spots = Spot.all
    end
    
    @markers = @spots.geocoded.map do |spot|
      {
        latitude: spot.latitude,
        longitude: spot.longitude,
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def show
    @marker =
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

  def filter_categories
    @categories = Category.all
  end

  private

  def set_spot
    @spot = Spot.find(params[:id])
  end
end
