class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create, :show]
  def index
    @users = User.all
    render :index
  end

  def show
    debugger
    @user = User.find_by(id: params[:id])
    render json: @user
  end

  def create 
    user = User.new(user_params)
    if user
      user.save
      redirect_to user_url(user)
    else
      redirect_to new_user_url
    end
  end

  def destroy 
    debugger
    user = User.find_by(id: params[:id])
    user.destroy  
    logout
    redirect_to new_user_url 
  end 
  
  private 
  def user_params 
        params.require(:user).permit(:username, :password)
  end 
end
