class UsersController < ApplicationController
  validates :name, presence: true,
        format: {with: /\A[a-zA-Z0-9_]{2,20}\z/, message: 'ne doit contenir que des caractères alphanumériques ou des _'},
        uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: { minimum: 8 }

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

  def show
  end

  private
  def user_params
    params.require(:user).permit(:name, :password)
  end
end
