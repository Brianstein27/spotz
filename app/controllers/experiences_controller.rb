class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_experience, only: %i[show edit update destroy]

  def index
    @experiences = Experience.all
    return unless params[:spot_id]

    @spot = Spot.find(params[:spot_id])
    links = Link.where(spot: params[:spot_id])
    @experiences = links.map { |link| link.experience }
  end

  def show
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.user = current_user
    if @experience.save
      redirect_to @experience, notice: 'Experience was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @experience.destroy
    redirect_to experiences_path
  end

  def edit
  end

  def update
    if @experience.update(experience_params)
      flash[:notice] = "Your experience was successfully updated."
      redirect_to experience_path(@experience)
    else
      render :edit
    end
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:name, :description)
  end
end
