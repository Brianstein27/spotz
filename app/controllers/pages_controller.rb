class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @spots = Spot.all
    @events = Event.all
    @experiences = Experience.all.sample(3)

    @markers = @spots.geocoded.map do |spot|
      {
        latitude: spot.latitude,
        longitude: spot.longitude,
        marker_html: render_to_string(partial: "spots/marker")
      }
    end
  end

  def profile
    @visits = Visit.where(user: current_user)
    @experiences = Experience.where(user: current_user)
    @reviews = Review.where(user: current_user)
  end

  def settings

  end
end
