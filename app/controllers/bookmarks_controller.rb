class BookmarksController < ApplicationController
  before_action :authenticate_user!, only: [ :index, :create, :destroy ]

  def index
    @bookmarks = Bookmark.all
  end

  def create
    @bookmark = current_user.bookmarks.new(bookmark_params)
    if @bookmark.save
      redirect_to bookmarks_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = current_user.bookmarks.find(params[:id])
    @bookmark.destroy
    redirect_to bookmarks_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:title, :url)
  end

end
