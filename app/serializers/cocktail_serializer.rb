class CocktailSerializer
    include FastJsonapi::ObjectSerializer
    attributes :name, :spirit
    has_many :recipes
end