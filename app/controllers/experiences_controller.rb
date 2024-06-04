class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    if params[:query].present?
      @experiences = Experience.where(params[:query])
    else
      @experiences = Experience.all
    end
  end

  def show
    @experience = Experience.find(params[:id])
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
