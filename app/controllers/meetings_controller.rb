class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:edit, :update, :destroy]

  def index
    @days = current_user.meetings.group_by { |meeting| meeting.created_at.to_date }
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = current_user.meetings.build(meeting_params)

    if @meeting.save
      flash[:notice] = 'meeting saved'
    else
      flash[:notice] = 'Something went wrong'
    end

    redirect_to action: :index
  end

  def destroy
    if @meeting.destroy
      flash[:notice] = 'Meeting deleted'
    else
      flash[:notice] = 'Something went wrong'
    end

    redirect_to action: :index
  end

  def edit
  end

  def update
    if @meeting.update_attributes(meeting_params)
      flash[:notice] = 'meeting updated!'
      redirect_to action: :index
    else
      flash[:notice] = 'Something went wrong'
      redirect_to action: :edit
    end
  end

  private

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  def meeting_params
    params.require(:meeting).permit(:content)
  end
end
