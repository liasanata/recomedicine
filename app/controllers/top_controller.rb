class TopController < ApplicationController

  def index
    # もしリクエストがGETメソッドであれば、params[:problem_check]を確認する
    if params[:problem_check].present?
      if params[:problem_check].include?('1')
        redirect_to controller: 'problems_check', action: 'recommendation_for_medical_examination' and return
      elsif params[:problem_check].include?('2')
        redirect_to controller: 'problems_check', action: 'precautions' and return
      elsif params[:problem_check].include?('0')
        redirect_to controller: 'symptoms', action: 'index' and return
      end
    end
  end
end
