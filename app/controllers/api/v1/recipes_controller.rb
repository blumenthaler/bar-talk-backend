class Api::V1::RecipesController < ApplicationController
    def index
        recipes = Recipe.all
        options = {
            include: [:user, :cocktail]
        }
        render json: RecipeSerializer.new(recipes, options)
    end
end
