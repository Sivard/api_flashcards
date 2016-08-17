# This migration comes from api_flashcards (originally 20160817172749)
class CreateApiFlashcardsCards < ActiveRecord::Migration
  def change
    create_table :api_flashcards_cards do |t|
      t.text     :original_text
      t.text     :translated_text
      t.datetime :review_date, :null => false
      t.integer  :api_flashcards_user_id, :null => false
      t.integer  :interval, :null => false, default: 1
      t.integer  :repeat, :null => false, default: 1
      t.float    :efactor, :null => false, default: 2.5
      t.integer  :attempt, :null => false, default: 1
      t.integer  :quality, :null => false, default: 5

      t.timestamps :null => false
    end
  end
end
