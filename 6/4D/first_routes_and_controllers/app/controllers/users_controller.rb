class UsersController < ApplicationController
    def index 
      render json: User.find(params[:id]) if params[:id]
      users = User.all
      render json: users 
    end

    def create
      # debugger
      user = User.new(user_data)
      if user.save #difference between .save and .save! save! fails loudly and wont let program continue
        render json: user
      else
        render json: user.errors.full_messages, status: :unprocessable_entity
      end
    end

    def show
      user = User.find(params[:id])
      render json: user
    end

    def update
        user = User.find(params[:id])
        user.update(user_data)
        render json: user
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: user
    end

    private 

    def user_data
        params.require(:user).permit(:username)
    end
end