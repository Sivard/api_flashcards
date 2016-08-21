module ApiFlashcards
  class Card < ActiveRecord::Base
    belongs_to :user, class_name: 'ApiFlashcards::User'

    # validates :api_flashcards_user_id, presence: true
    # validates :original_text, :translated_text, :review_date,
    #           presence: { message: 'Необходимо заполнить поле.' }
    # validates :api_flashcards_user_id, presence: { message: 'Ошибка ассоциации.' }
    # validates :interval, :repeat, :efactor, :quality, :attempt, presence: true
  end
end
