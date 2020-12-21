class Api::V1::CocktailsController < ApplicationController
  def index
    cocktails = Cocktail.all
    options = {}
    options[:meta] = { total: 3 }
    options[:include] = [:recipes, :'recipes.ingredients', :'recipes.comments', :'recipes.user']
    render json: CocktailSerializer.new(cocktails, options)
  end
end