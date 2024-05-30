class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    if params[:query].present?
      @experience = Experience.where(params[:query])
    else
      @experience = Experience.all
    end
  end

  def show
    @experience = Experience.find(params[:id])
  end

  def new
    @experience = Experience.new
  end

  def destroy
    @experience.destroy
    # redirect_to experiences_path
  end

  def edit
    @experience = Experience.find(params[:id])
  end

  def update
    @experience = Experience.find(params[:id])
    if @experience.update(experience_params)
      flash[:notice] = "Your experience was successfully updated."
      redirect_to experience_path(@experience)
    else
      render :edit
    end
  end

  private

  def experience_params
    params.require(:experience).permit(:name, :description)
  end

end
