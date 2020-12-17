class Api::V1::CocktailsController < ApplicationController
  def index
    cocktails = Cocktail.all
    options = {
        include: [:recipes]
    }
    render json: CocktailSerializer.new(cocktails, options)
  end
end
