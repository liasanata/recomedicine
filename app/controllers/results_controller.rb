class ResultsController < ApplicationController
  def index
    selected_symptoms = params[:symptoms] || []

    # 選択された症状に関連する成分を取得し、重複を排除
    @ingredients = Ingredient.joins(:symptoms)
                             .where(symptoms: { id: selected_symptoms })
                             .distinct  # 重複を排除

    # 成分を選択された症状名ごとにグループ化
    @grouped_ingredients = @ingredients.group_by do |ingredient|
      ingredient.symptoms.where(id: selected_symptoms).pluck(:name)
    end.select { |symptom_names, _| symptom_names.any? }

    # もし@grouped_ingredientsが空だった場合、該当する成分があったか確認
    if @grouped_ingredients.empty? && @ingredients.any?
      @grouped_ingredients = @ingredients.group_by { |ingredient| ingredient.symptoms.pluck(:name).uniq }
    end
  end
end
