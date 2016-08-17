require_dependency "api_flashcards/application_controller"

module ApiFlashcards
  class Api::V1::CardsController < ApplicationController
    before_action :set_card, only: :update
    respond_to :json

    def index
      @cards = current_user.cards.order('review_date')
      respond_with :api, :v1, @cards
    end

    def create
      @card = current_user.cards.create(card_params)
      respond_with :api, :v1, @card
    end

    def update
      @card.update(card_params)
      respond_with :api, :v1, @card
    end

    private

    def set_card
      @card = current_user.cards.find(params[:id])
    end

    def card_params
      params.require(:card).permit(:original_text,
                                   :translated_text,
                                   :review_date,
                                   :block_id
                                  )
    end
  end
end
