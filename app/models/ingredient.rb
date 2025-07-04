class Ingredient < ApplicationRecord
  has_many :symptom_ingredients
  has_many :symptoms, through: :symptom_ingredients

  def save_symptoms(symptoms)
    return if symptoms.blank?

    current_symptoms = self.symptoms.pluck(:name)

    manage_old_symptoms(current_symptoms, symptoms)
    manage_new_symptoms(current_symptoms, symptoms)
  end

  private

  def manage_old_symptoms(current_symptoms, symptoms)
    old_symptoms = current_symptoms - symptoms
    old_symptoms.each do |old_name|
      self.symptoms.delete Symptom.find_by(name: old_name)
    end
  end

  def manage_new_symptoms(current_symptoms, symptoms)
    new_symptoms = symptoms - current_symptoms
    new_symptoms.each do |new_name|
      ingredient_symptom = Symptom.find_or_create_by(name: new_name)
      self.symptoms << ingredient_symptom unless self.symptoms.include?(ingredient_symptom)
    end
  end
end