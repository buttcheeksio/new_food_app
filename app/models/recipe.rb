class Recipe < ApplicationRecord
  has_many :directions
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  accepts_nested_attributes_for :directions,
      reject_if: proc { |attributes| attributes['step'].blank? },
      allow_destroy: true

  accepts_nested_attributes_for :ingredients,
      reject_if: proc { |attributes| attributes['name'].blank? },
      allow_destroy: true

  validates :title, :description, presence: true
end
