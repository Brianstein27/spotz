class SearchController < ApplicationController
  def search_spots
    search_field = params[:search].present? ? params[:search] : '*'
    category_id = params[:category].present? ? params[:category].to_i : nil
    max_distance = params[:distance].present? ? params[:distance].to_i : nil

    @geoapify_hash = make_geoapify_request(ENV['GEOAPIFY_API_KEY'], '87.184.167.191') 

    if max_distance and category_id
      in_range = Spot.near([@geoapify_hash["latitude"], @geoapify_hash["longitude"]], max_distance, unit: :km)
      in_search = Spot.search(search_field, fields: [:name, :description], operator: "or", where: { category_id: category_id })
      results = in_search.select{ |spot| in_range.include?(spot) }
      @spots = results
    elsif max_distance 
      in_range = Spot.near([@geoapify_hash["latitude"], @geoapify_hash["longitude"]], max_distance, unit: :km)
      in_search = Spot.search(search_field, fields: [:name, :description], operator: "or")
      results = in_search.select{ |spot| in_range.include?(spot) }
      @spots = results
    elsif category_id
      @spots = Spot.search(search_field, fields: [:name, :description], operator: "or", where: { category_id: category_id})
    else
      @spots = Spot.search(search_field, fields: [:name, :description], operator: "or")
    end


    respond_to do |format|
      format.html { render :index }
      format.turbo_stream do
        render turbo_stream:
            turbo_stream.update('spots', partial: "pages/desktop_spot_grid", locals: {spots: @spots})
      end
    end
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
