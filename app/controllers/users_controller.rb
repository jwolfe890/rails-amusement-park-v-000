class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else 
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    unless current_user
      redirect_to root_path
    end
  end

  def edit

  end

  def update

  end

  private
    def user_params
      params.require(:user).permit(:name, :height, :password, :happiness, :nausea, :tickets, :admin)
    end

end
