class SymptomIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :symptom
  validates :ingredient_id, presence: true
  validates :symptom_id, uniqueness: { scope: :ingredient_id }
end
