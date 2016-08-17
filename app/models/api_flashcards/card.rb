module ApiFlashcards
  class Card < ActiveRecord::Base
    belongs_to :user
  end
end
