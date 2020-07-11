class GoalsController < ApplicationController
  before_action :set_goal, only: [:edit, :update, :destroy, :show]

  def index
    @goals = current_user.goals
  end

  def create
    @goal = current_user.goals.build(goal_params)

    if @goal.save
      flash[:notice] = 'Goal saved'
    else
      flash[:notice] = 'Something went wrong'
    end

    redirect_to action: :index
  end

  def destroy
    if @goal.destroy
      flash[:notice] = 'Goal removed'
    else
      flash[:notice] = 'Something went wrong'
    end

    redirect_to action: :index
  end

  def edit
  end

  def update
    if @goal.update_attributes(goal_params)
      flash[:notice] = 'Goal updated!'
      redirect_to action: :index
    else
      flash[:notice] = 'Something went wrong'
      redirect_to action: :edit
    end
  end

  def show
  end

  private

  def set_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:content)
  end
end
