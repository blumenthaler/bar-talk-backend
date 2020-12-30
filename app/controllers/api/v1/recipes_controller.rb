class Api::V1::RecipesController < ApplicationController
    def index
        recipes = Recipe.all
        options = {
            include: [:user, :cocktail, :comments]
        }
        render json: RecipeSerializer.new(recipes, options)
    end

    def create
        recipe = Recipe.new(recipe_params)
        recipe.votes = 0
        # find all cocktails with the recipe's name
        named = Cocktail.all.select{|c| c.name === recipe_params[:name]}

        spirit = recipe_params[:spirit].downcase

        # try to find the cocktail with same name AND spirit
        maybe_cocktail = named.find{|c| c.spirit === spirit}
        if maybe_cocktail
            recipe.cocktail = maybe_cocktail
        else
            # if cocktail of same name and spirit does not exist, create one!
            new_cocktail = Cocktail.create(name: recipe_params[:name], spirit: spirit)
            recipe.cocktail = new_cocktail
        end 
        if recipe.save
            options = {
                include: [:user, :cocktail, :comments]
            }
            render json: RecipeSerializer.new(recipe, options)
        else
            render json: recipe.errors, status: :unprocessable_entity
        end
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :spirit, :ingredients, :garnish, :notes, :user_id, :cocktail_id)
    end
end
