module ApiFlashcards
  class User < ActiveRecord::Base
    authenticates_with_sorcery!

    has_many :cards, dependent: :destroy
  end
end
