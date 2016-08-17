class SorceryCore < ActiveRecord::Migration
  def change
    create_table :api_flashcards_users do |t|
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt

      t.timestamps
    end

    add_index :api_flashcards_users, :email, unique: true
  end
end