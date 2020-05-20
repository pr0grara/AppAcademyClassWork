class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email], params[:user][:password]
    )
    self.login(user)
    redirect_to user_url(user.id)
  end
end
