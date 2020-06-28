class AccomplishmentsController < ApplicationController
  before_action :set_accomplishment, only: [:edit, :update, :destroy]

  def index
    @accomplishments = current_user.accomplishments
  end

  def create
    @accomplishment = current_user.accomplishments.build(accomplishment_params)

    if @accomplishment.save
      flash[:notice] = 'Accomplishment saved'
    else
      flash[:notice] = 'Something went wrong'
    end

    redirect_to action: :index
  end

  def destroy
    if @accomplishment.destroy
      flash[:notice] = 'Accomplishment unaccomplished'
    else
      flash[:notice] = 'Something went wrong'
    end

    redirect_to action: :index
  end

  def edit
  end

  def update
    if @accomplishment.update_attributes(accomplishment_params)
      flash[:notice] = 'Accomplishment updated!'
      redirect_to action: :index
    else
      flash[:notice] = 'Something went wrong'
      redirect_to action: :edit
    end
  end

  private

  def set_accomplishment
    @accomplishment = Accomplishment.find(params[:id])
  end

  def accomplishment_params
    params.require(:accomplishment).permit(:content)
  end
end
