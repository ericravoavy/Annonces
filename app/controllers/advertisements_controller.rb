class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
  end
  
  def create
  end

  def update
  end

  def destroy
  end

  def edit
  end
end
