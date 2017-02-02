class AdvertisementsController < ApplicationController
  def index
    if session[:admin]
      @advertisements = Advertisement.all
    else
      @advertisements = Advertisement.all.where(published: true) 
    end
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
  end
  
  def create
  end

  def update
    @advertisement.update adver_params
    redirect_to advertisement_path(params[:id])
  end

  def destroy
  end

  def edit
  end

  private
  def adver_params
    params.require(:advertisement).permit(:title, :content, :published, :user_id)
  end
end
