module ApiFlashcards
  class CardSerializer < ActiveModel::Serializer
    attributes :id,
               :original_text,
               :translated_text,
               :review_date,
               :interval,
               :repeat,
               :efactor,
               :attempt,
               :quality
  end
end
