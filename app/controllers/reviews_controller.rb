class ReviewsController < ApplicationController
  def index
    @review = Review.where(user: current_user, reviewable: params[:spot_id]).first if params[:spot_id]
    if params[:spot_id]
      @spot = Spot.find(params[:spot_id])
      @reviews = Review.where(reviewable_type: "Spot", reviewable_id: params[:spot_id])
    else
      @experience = Experience.find(params[:experience_id])
      @reviews = Review.where(reviewable_type: "Experience", reviewable_id: params[:experience_id])
    end
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
      redirect_back(fallback_location: spot_path(@reviewable))
    elsif params[:experience_id]
      @reviewable = Experience.find(params[:experience_id])
      @review.reviewable = @reviewable
      @review.save
      redirect_back(fallback_location: experience_path(@reviewable))
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)

    return unless @review.reviewable_type == "Spot"
    redirect_to spot_path(@review.reviewable)

    return unless @review.reviewable_type == "Experience"
    redirect_to experience_path(@review.reviewable)
  end

  def destroy
    @review = Review.find(params[:id])
    @reviewable = @review.reviewable
    @type = @review.reviewable_type

    @review.delete

    if @type == "Spot"
      redirect_back(fallback_location: spot_path(@reviewable))
    elsif @type == "Experience"
      redirect_back(fallback_location: experience_path(@reviewable))
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
