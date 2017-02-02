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
    @advertisement = Advertisement.new adver_params
    if @advertisement.save
      flash[:info] = "Votre annonce a été enregistrée, elle sera prochainement validée par l'adminitrateur"
      redirect_to advertisement_path(@advertisement)
    else
      flash[:info] = "Échec de l'enregistrement de votre annonce"
      render :new
    end
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
