class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_experience, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @experiences = Experience.where(params[:query])
    else
      @experiences = Experience.all
    end
  end

  def show
  end

  def new
    @experience = Experience.new
  end

  def destroy
    @experience.destroy
    redirect_to experiences_path
  end

  def edit
  end

  def update
    raise
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
