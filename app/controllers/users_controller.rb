class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def check
       @current_user = User.where(name: params[:name], password: params[:password]).first
       puts @current_user.inspect
      if @user
          session[:user_id] = @current_user.id
          redirect_to profil_path, success: 'Connexion réussie'
      else
          session[:user_id] = nil
          redirect_to new_user_path, danger: 'Identifiants incorrects'
      end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password)
  end
end