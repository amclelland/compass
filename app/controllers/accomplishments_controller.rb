class AccomplishmentsController < ApplicationController
  def index
    @accomplishments = current_user.accomplishments
  end

  def create
    @accomplishment = current_user.accomplishments.build(accomplishment_params)

    if @accomplishment.save
      redirect_to action: :index
    else
      flash[:notice] = 'Something went wrong'
      redirect_to action: :index
    end
  end

  private

  def accomplishment_params
    params.require(:accomplishment).permit(:content)
  end
end
