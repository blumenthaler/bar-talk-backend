class RecipeSerializer
    include FastJsonapi::ObjectSerializer
    attributes :name, :ingredients, :garnish, :notes, :votes
    belongs_to :user
    belongs_to :cocktail
    has_many :comments
end