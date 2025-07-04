class Symptom < ApplicationRecord
  has_many :symptom_ingredients
  has_many :ingredients, through: :symptom_ingredients
  validates :name, presence: true, uniqueness: true
end
