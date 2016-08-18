module ApiFlashcards
  class User < ActiveRecord::Base
    authenticates_with_sorcery!

    has_many :cards, class_name: 'ApiFlashcards::Card', foreign_key: :user_id
  end
end
