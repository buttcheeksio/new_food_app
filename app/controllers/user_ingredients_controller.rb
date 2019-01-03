class UserIngredientsController < ApplicationController
  before_action :find_user, only: [:cupboard, :edit, :update]

  def cupboard #this is the index
  end

  def edit
    @ingredients = Ingredient.all
  end

  def update
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_ingredient_params
    params.require(:recipe).permit(:user_id, :ingredient_id)
  end
end
