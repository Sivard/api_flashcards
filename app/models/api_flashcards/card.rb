module ApiFlashcards
  class Card < ActiveRecord::Base
    belongs_to :user, class_name: 'ApiFlashcards::User'
  end
end
