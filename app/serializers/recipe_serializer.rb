class RecipeSerializer
    include FastJsonapi::ObjectSerializer
    attributes :name, :spirit, :ingredients, :garnish, :notes, :votes
    belongs_to :user
    belongs_to :cocktail
    has_many :comments
end