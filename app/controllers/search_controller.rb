class SearchController < ApplicationController
  def search_spots
    search_field = params[:search].present? ? params[:search] : '*'
    category_id = params[:category].present? ? params[:category].to_i : nil

    @spots = if category_id
      Spot.search(search_field, fields: [:name, :description], operator: "or", where: { category_id: category_id})
    else
      Spot.search(search_field, fields: [:name, :description], operator: "or")

    end

    respond_to do |format|
      format.html { render :index }
      format.turbo_stream do
        render turbo_stream:
            turbo_stream.update('spots', partial: "pages/desktop_spot_grid", locals: {spots: @spots})
      end
    end
  end
end
