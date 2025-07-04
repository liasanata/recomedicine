class CreateIngredients < ActiveRecord::Migration[7.2]
  def change
    create_table :ingredients do |t|
      t.string :name, :limit => 50, null: false
      t.string :body, null: false

      t.timestamps
    end
  end
end
