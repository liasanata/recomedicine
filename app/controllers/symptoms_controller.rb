class SymptomsController < ApplicationController

  def index
    @symptoms = Symptom.all
  end

  private

  def symptom_params
    params.require(:symptom).permit(:name, :body)
  end
end
