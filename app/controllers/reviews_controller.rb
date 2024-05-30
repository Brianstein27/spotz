class ReviewsController < ApplicationController

  def index
    @reviews = Review.where()
  end

  def new
    @review = Review.new
    if params[:spot_id]
      @reviewable = Spot.find(params[:spot_id])
    elsif params[:experience_id]
      @reviewable = Experience.find(params[:experience_id])
    end
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    if params[:spot_id]
      @reviewable = Spot.find(params[:spot_id])
      @review.reviewable = @reviewable
      @review.save
      redirect_to spot_path(@reviewable)
    elsif params[:experience_id]
      @reviewable = Experience.find(params[:experience_id])
      @review.reviewable = @reviewable
      @review.save
      redirect_to experience_path(@reviewable)
    end
  end

private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
