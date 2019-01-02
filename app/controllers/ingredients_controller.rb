class IngredientsController < ApplicationController
  before_action :find_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @ingredients = Ingredient.all
  end

  def show

  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)

    if @ingredient.save
      redirect_to @ingredient, notice: "Successfully created ingredient"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to @ingredient
    else
      render 'edit'
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_path, notice: "Successfully deleted ingredient"
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :ingredient_type, recipe_ingredients_attributes: [:id, :_destroy])
  end

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
