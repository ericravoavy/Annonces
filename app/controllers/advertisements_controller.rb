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
    if session[:user_id].nil?
      flash[:info] = "Vous devez être enregistré pour publier une annonce"
      redirect_to login_path
    else
      @user = User.find(session[:user_id])
      flash[:info] = "Bonjour #{@user.name}, qu'avez-vous à vendre ?"
      render :new
    end
  end
  
  def create
    @advertisement = Advertisement.new adver_params
     if @advertisement.save
      flash[:info] = "Votre annonce a été enregistrée, elle sera prochainement validée par l'adminitrateur"
      redirect_to advertisement_path(@advertisement)
    else
      flash[:info] = "Échec de l'enregistrement de votre annonce"
      render :new
    end
  end

  def publish
    if params[:published] == true
      flash[:info] = "L'annonce est maintenant publiée"
    elsif params[:published] == false
      flash[:info] = "L'annonce est maintenant hors ligne"
    end
    Advertisement.find(params[:id]).update published: params[:published]
    redirect_to root_path
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
    @advertisement = Advertisement.find(params[:id])
    @advertisement.destroy
    flash[:info] = "Annonce supprimée"
    redirect_to root_path
  end

  def edit
    @advertisement = Advertisement.find(params[:id])
  end

  def update
    if @advertisement.update adver_params
      flash[:info] = "Annonce mise à jour correctement"
      redirect_to advertisement_path
    else
      flash[:info] = "Annonce non mise à jour, un problème a été détécté"
      render :edit
    end
  end

  private
  def adver_params
    params.require(:advertisement).permit(:title, :content, :published, :price, :user_id)
  end
end
