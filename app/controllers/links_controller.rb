class LinksController < ApplicationController
  def new
    @user = User.find(params[user_id:])
    @spot = Spot.find(params[spot_id:])
    @link = Link.new
  end

  def create
    @user = User.find(params[user_id:])
    @spot = Spot.find(params[spot_id:])
    @link = Link.new(links_params)
  end

  def destroy
    @link = Link.find(params[id:])
    @link.destroy
  end

  private

  def links_params
    params.require(:link).permit(:spot_id, :user_id)
  end
end
