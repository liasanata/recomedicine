class IngredientsController < ApplicationController
  def index
     @ingredient = Ingredient.all
     symptom_list = params[:ingredient][:symptom_id].split(',')
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :body)
  end
end
