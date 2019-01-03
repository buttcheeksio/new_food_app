class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  validates :name, :ingredient_type, presence: true

  has_many :user_ingredients
  has_many :users, through: :user_ingredients
end
