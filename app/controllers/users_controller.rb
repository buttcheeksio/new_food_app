class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :search]

  def show
  end

  def edit
    @user.user_ingredients.build
    @ingredients = Ingredient.all
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def search

    @available_recipes = @user.beef_function
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(user_ingredients_attributes: [:id, :user_id, :ingredient_id, :_destroy], ingredients_attributes: [:id, :name, :_destroy])
  end
end
