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
	puts @current_user.inspect
       @current_user = User.where(name: params[:name], password: params[:password]).first
      if @current_user
          session[:user_id] = @current_user.id
          if @current_user.role == "admin"
            session[:admin] = true
          end
          flash[:info] = "Bienvenue #{@current_user.name} !"
          redirect_to root_path
      else
          session[:user_id] = nil
          flash[:info] = "Échec de la connexion"
          redirect_to new_user_path
      end
  end

  def destroy
      session[:user_id] = nil
      if !session[:admin].nil?
        session[:admin] = nil
      end
      flash[:info] = "Vous êtes déconnecté, à bientôt"
      redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :password)
  end
end
