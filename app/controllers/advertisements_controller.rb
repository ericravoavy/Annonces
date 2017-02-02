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
    @advertisement = Advertisement.find(params[:id])
    if @advertisement.update adver_params
      redirect_to advertisement_path(params[:id])
    else
      flash[:info] = "Échec de la publication"
      redirect_to root_path
    end
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
