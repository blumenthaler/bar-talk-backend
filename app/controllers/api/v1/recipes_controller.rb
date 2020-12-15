class Api::V1::RecipesController < ApplicationController
    def index
        recipes = Recipe.all
        options = {
            include: [:user]
        }
        render json: RecipeSerializer.new(recipes, options)
    end
end
