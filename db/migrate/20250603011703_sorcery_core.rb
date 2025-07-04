class SorceryCore < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name, :limit => 30, null: false
      t.string :email,            null: false, index: { unique: true }
      t.string :crypted_password, null: false
      t.string :reset_password_token, :string
      t.string :salt
      t.integer :role

      t.timestamps                null: false
    end
  end
end
