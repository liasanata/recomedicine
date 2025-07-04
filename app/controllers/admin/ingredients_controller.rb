class Admin::IngredientsController < Admin::BaseController
  def index
     @ingredient = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    symptom_list = params[:ingredient][:symptom_id].split(',')

   if save_ingredient(@ingredient, symptom_list)
      redirect_to admin_ingredients_path, success: '成分を登録しました'
    else
      flash.now[:danger] = '成分を登録できませんでした'
      render :new
    end
  end
  
  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    symptom_list = params[:ingredient][:symptom_id].split(',')

    if @ingredient.update(ingredient_params)
      @ingredient.save_symptoms(symptom_list)
      redirect_to admin_ingredients_path, success: '成分を更新しました'
    else
      flash.now[:danger] = '成分を更新できませんでした'
      render :edit
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.symptom_ingredients.destroy_all # 関連レコードを削除
    @ingredient.destroy # 成分を削除
    redirect_to admin_ingredients_path, notice: '成分が削除されました'
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :body)
  end

  def save_ingredient(ingredient, symptom_list)
    if ingredient.save
      ingredient.save_symptoms(symptom_list)
      return true
    end
    false
  end
end
