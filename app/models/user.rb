class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes
  has_many :user_ingredients
  has_many :ingredients, through: :user_ingredients

  accepts_nested_attributes_for :user_ingredients, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

  def beef_function

    ui = self.ingredients
    available_recipes = []

    Recipe.all.each do |recipe|
      if !(ui & recipe.ingredients).empty? && (ui & recipe.ingredients).length == recipe.ingredients.length
        available_recipes << recipe
      end
    end
    available_recipes
  end

end #end of User class
