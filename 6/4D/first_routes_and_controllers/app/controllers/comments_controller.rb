class CommentsController < ApplicationController
    def index 
        if params[:user_id]
            source = User.find(params[:user_id])
        elsif params[:artwork_id]
            source = Artwork.find(params[:artwork_id])
        end
        render json: source.comments
    end
end
