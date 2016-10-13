class SessionsController < ApplicationController

  def new
    @users = User.all
  end

  def create
    @user = User.find_by(name: params[:user][:name])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to @user
      else
        # redirect_to signin_path
        render :new
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


