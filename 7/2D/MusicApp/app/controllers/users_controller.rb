class UsersController < ApplicationController
skip_before_action :verify_authenticity_token

def show
  @user = User.find(params[:id])
  render :show
end

def new
  render :new
end

def index
  @users = User.all
  render :index
end

def create
  user = User.new(user_params)
  if user.save
    redirect_to users_url
  else
    render json: user.errors.full_messages
  end
end

private
def user_params
  params.require(:user).permit(:email, :password)
end

end
