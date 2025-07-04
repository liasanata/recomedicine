class Admin::SymptomsController < Admin::BaseController

  def index
    @symptoms = Symptom.all
  end

  def new
    @symptom = Symptom.new
  end

  def create
    @symptom = Symptoms.new(symptom_params)

    if symptom.save
      redirect_to admin_symptoms_path, success: '症状を登録しました'
    else
      flash.now[:danger] = '症状を登録できませんでした'
    render :new
    end
  end
  
  def edit
    @symptom = Symptom.find(params[:id])
  end

  def update
    @symptom = Symptom.find(params[:id])

    if @symptom.update(symptom_params)
      redirect_to admin_symptoms_path, success: '症状を更新しました'
    else
      flash.now[:danger] = '症状を更新できませんでした'
      render :edit
    end
  end

  def destroy
    @symptom = Symptom.find(params[:id])
    @symptom.symptom_ingredients.destroy_all # 関連レコードを削除
    @symptom.destroy # 症状を削除
    redirect_to admin_symptoms_path, notice: '症状が削除されました'
  end

  private

  def symptom_params
    params.require(:symptom).permit(:name, :body)
  end
end
