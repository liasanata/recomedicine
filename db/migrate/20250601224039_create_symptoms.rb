class CreateSymptoms < ActiveRecord::Migration[7.2]
  def change
        create_table :symptoms do |t|
      t.string :name, :limit => 50, null: false

      t.timestamps
    end
    add_index :symptoms, :name, unique: true
  end
end
