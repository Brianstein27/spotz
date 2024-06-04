class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.where(user: current_user)
  end

  def create
    @bookmark = Bookmark.new
    @spot = Spot.find(params[:spot_id]) if params[:spot_id]
    @spot = Spot.find(params[:id]) if params[:id]
    @bookmark.user = current_user
    @bookmark.spot = @spot

    redirect_back(fallback_location: @spot) if @bookmark.save
  end

  def destroy
    @spot = Spot.find(params[:id])
    @bookmark = Bookmark.where(user: current_user, spot: @spot).first
    @bookmark.delete

    redirect_back(fallback_location: @spot)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:title, :url)
  end
end
