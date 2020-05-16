class CatsController < ApplicationController

    def index
        @cats = Cat.all 
        render :index
        # render('cats', { banana: @user } )
    end

    def show
        @kitty = Cat.find(params[:id])
        render :show
    end

    def new
      # @cat = Cat.new
      # CAT_COLORS = ['white', 'brown', 'black', 'orange', 'gray']
      render :new
    end
end
