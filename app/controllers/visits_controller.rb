class VisitsController < ApplicationController
  def create
    @visit = Visit.new
    @spot = Spot.find(params[:spot_id])
    @visit.user = current_user
    @visit.spot = @spot

    redirect_to @spot, notice: "spot was added to visited" if @visit.save
  end

  def destroy
    @spot = Spot.find(params[:id])
    @visit = Visit.where(user: current_user, spot: @spot).first
    @visit.delete

    redirect_to @spot, notice: "spot was removed from visited list"
  end

  private

  def visit_params
    params.require(:visit).permit(:spot_id, :user_id)
  end
end
