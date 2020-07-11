class Goals::CheckinsController < ApplicationController
  before_action :set_goal
  before_action :set_checkin, only: [:destroy]

  def new
    @last_checkin = @goal.checkins.last
  end

  def create
    @checkin = @goal.checkins.build(checkin_params)

    if @checkin.save
      flash[:notice] = 'Checkin created!'
      redirect_to goal_path(@goal)
    else
      flash[:error] = 'Something went wrong creating the checkin'

      render :new
    end
  end

  def destroy
    if @checkin.destroy
      flash[:notice] = 'Checkin CRUSHED 🔥!'
    else
      flash[:error] = 'Something went wrong destroying the checkin'
    end

    redirect_to goal_path(@goal)
  end

  private

  def set_goal
    @goal = Goal.find(params[:goal_id])
  end

  def set_checkin
    @checkin = Goal::Checkin.find(params[:id])
  end

  def checkin_params
    params.require(:goal_checkin).permit(:content, :progress)
  end
end
