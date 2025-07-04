class CreateSymptomIngredients < ActiveRecord::Migration[7.2]
  def change
    create_table :symptom_ingredients do |t|
      t.references :ingredient, null: false, foreign_key: true
      t.references :symptom, null: false, foreign_key: true

      t.timestamps
    end
    add_index :symptom_ingredients, [:ingredient_id, :symptom_id], unique: true
  end
end
