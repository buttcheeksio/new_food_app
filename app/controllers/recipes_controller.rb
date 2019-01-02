class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all.order("created_at DESC")
  end

  def show
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all

    @recipe.recipe_ingredients.build
    @recipe.directions.build
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      byebug
      params[:recipe_ingredients].each do |recipe_ingredient|
        RecipeIngredient.create(recipe_id:@recipe.id, ingredient_id:params[:recipe_ingredients][:id])
      end

      redirect_to @recipe, notice: "Successfully created recipe"
    else
      render 'new'
    end


  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
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
