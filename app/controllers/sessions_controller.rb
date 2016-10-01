class SessionsController < ApplicationController

  def new
    @users = User.all
  end

  def create
    if params[:user][:password].blank?
      redirect_to signin_path
    else
      @user = User.find_by(id: params[:user][:id])
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to signin_path
      end
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:id, :password)
    end
end