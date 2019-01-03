class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @recipes = Recipe.all.order("created_at DESC")
  end

  def show
  end

  def new
    @recipe = current_user.recipes.build
    @ingredients = Ingredient.all

    @recipe.recipe_ingredients.build
    @recipe.directions.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      params[:recipe][:recipe_ingredients_attributes].each do |recipe_ingredient_attribute|
          RecipeIngredient.create(recipe_id:@recipe.id, ingredient_id:recipe_ingredient_attribute[1][:ingredient_id], amount:recipe_ingredient_attribute[1][:amount])
      end

      redirect_to @recipe, notice: "Successfully created recipe"
    else
      render 'new'
    end
  end

  def edit
    @ingredients = Ingredient.all
  end

  def update
    if @recipe.update(recipe_params)
      params[:recipe][:recipe_ingredients_attributes].each do |recipe_ingredient_attribute|
          RecipeIngredient.update(recipe_id:@recipe.id, ingredient_id:recipe_ingredient_attribute[1][:ingredient_id], amount:recipe_ingredient_attribute[1][:amount])
      end
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root_path, notice: "Successfully deleted recipe"
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, directions_attributes: [:id, :step, :_destroy], recipe_ingredients_attributes: [:id, :user_id, :recipe_id, :_destroy], ingredients_attributes: [:id, :name, :_destroy])
  end
end
