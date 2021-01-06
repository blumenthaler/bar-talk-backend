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
        spirit = recipe_params[:spirit].downcase

        named = Cocktail.all.select{|c| c.name === recipe_params[:name]}
        if !named.empty?
            maybe_cocktail = named.find{|c| c.spirit === spirit}
            if maybe_cocktail
                recipe.cocktail = maybe_cocktail
            else
                new_cocktail = Cocktail.create(name: recipe_params[:name], spirit: spirit)
                recipe.cocktail = new_cocktail
            end
        else
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

    def update
        recipe = Recipe.find_by(id: params[:id])
        if recipe.update(recipe_params)
            options = {
                include: [:user, :cocktail, :comments]
            }
            render json: RecipeSerializer.new(recipe, options)
        else
            render json: recipe.errors, status: :unprocessable_entity
        end
    end

    def destroy
        recipe = Recipe.find_by(id: params[:id])
        if recipe.destroy
            render json:  { data: "Recipe successfully destroyed" }, status: :ok
        else
            error_resp = {
              error: "Recipe not found and not destroyed"
            }
            render json: error_resp, status: :unprocessable_entity
        end
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :spirit, :ingredients, :garnish, :notes, :user_id, :cocktail_id)
    end
end
