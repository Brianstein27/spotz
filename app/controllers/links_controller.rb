class LinksController < ApplicationController
  def new
    return unless params[:experience_id]

    @link = Link.new
    @spots = Spot.all
    @experience = Experience.find(params[:experience_id])
  end

  def create
    @link = Link.new
    spot = Spot.find(params[:link][:spot].to_i)
    experience = Experience.find(params[:experience_id])
    @link.spot = spot
    @link.experience = experience

    return unless @link.save

    redirect_to experience_path(experience)
  end

  def add_spot
    @link = Link.new
    @spots = Spot.all
  end

  def destroy
    @link = Link.find(params[:id])
    @link.delete

    redirect_back(fallback_location: root_path)
  end

  private

  def links_params
    params.require(:link).permit(:experience_id, :spot)
  end
end
