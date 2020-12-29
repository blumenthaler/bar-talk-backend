class Api::V1::RecipesController < ApplicationController
    def index
        recipes = Recipe.all
        options = {
            include: [:user, :cocktail, :comments]
        }
        render json: RecipeSerializer.new(recipes, options)
    end

    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.votes = 0
        options = {
            include: [:user, :cocktail, :comments]
        }
        if @recipe.save
            render json: RecipeSerializer.new(@recipe, options)
        else
            render json: @recipe.errors, status: :unprocessable_entity
        end
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :spirit, :ingredients, :garnish, :notes, :user_id, :cocktail_id)
    end
end
