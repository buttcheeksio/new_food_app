class AddAmountToRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    add_column :recipe_ingredients, :amount, :string
  end
end
