class Recipe < ApplicationRecord
    has_many :comments
    belongs_to :user
    belongs_to :cocktail
end
