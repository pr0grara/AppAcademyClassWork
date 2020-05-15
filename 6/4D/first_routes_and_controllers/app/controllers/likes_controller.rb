class LikesController < ApplicationController
  def index 
    if params[:user_id]
      user = User.find(params[:user_id])
      render json: user.liked_comments + user.liked_artworks
    elsif params[:comment_id] 
        comment = Comment.find(params[:comment_id])
        render json: comment.user_likes
    elsif params[:artwork_id]
        artwork = Artwork.find(params[:artwork_id])
        render json: artwork.user_likes
    end
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
