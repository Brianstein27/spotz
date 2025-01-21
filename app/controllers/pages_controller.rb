class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @spots = Spot.all
    @events = Event.all
    @experiences = Experience.all.sample(3)

    @geoapify_hash = make_geoapify_request(ENV['GEOAPIFY_API_KEY'], '206.22.56.21') 
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

  private

  def client_ip
    request.remote_ip
  end

  def make_geoapify_request(api_key, ip_address)
    uri = "https://api.geoapify.com/v1/ipinfo?ip=#{ip_address}&apiKey=#{api_key}"

    response = HTTParty.get(uri)
    parsed_response = JSON.parse(response.body)
    return parsed_response["location"]
    rescue StandardError => error
    puts "Error (#{ error.message })"
  end
end
