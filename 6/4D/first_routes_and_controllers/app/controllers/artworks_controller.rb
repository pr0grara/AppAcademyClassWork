class ArtworksController < ApplicationController
    def index 
      user = User.find(params[:user_id])  
      artworks = user.artworks + user.shared_artworks
      render json: artworks 
    end

    def create
      artwork = Artwork.new(artwork_data)
      if artwork.save 
        render json: artwork
      else
        render json: artwork.errors.full_messages, status: :unprocessable_entity
      end
    end

    def show
      artwork = Artwork.find(params[:id])
      render json: artwork
    end

    def update
        artwork = Artwork.find(params[:id])
        artwork.update(artwork_data)
        render json: artwork
    end

    def destroy
        artwork = Artwork.find(params[:id])
        artwork.destroy
        render json: artwork
    end

    private 

    def artwork_data
        params.require(:artwork).permit(:image_url, :title, :artist_id)
    end
end
