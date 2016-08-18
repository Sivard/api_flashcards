require 'rails_helper'

module ApiFlashcards
  RSpec.describe Api::V1::CardsController, type: :controller do
    routes { ApiFlashcards::Engine.routes }

    let(:user) { create(:user) }
    before(:each) do
      10.times do
        # create(:card)
        Card.create(original_text: 'дом',
                    translated_text: 'house',
                    interval: 1,
                    repeat: 1,
                    efactor: 2.5,
                    quality: 5,
                    attempt: 1,
                    review_date: Time.now,
                    api_flashcards_user_id: user.id)
      end

      page.driver.browser.authorize user.email, '1234'
    end

    describe 'index page list' do
      before do
        visit api_v1_cards_path
      end
      
      it 'check success response' do
        expect(response).to be_success
      end

      it 'check number objects' do
        json = JSON.parse(page.body)
        expect(json.length).to eq(10)
      end
    end

    describe 'update' do
      # it 'success update' do
      #   @request.headers['Content-Type'] = 'application/vnd.api+json'

      #   card = Card.last
      #   card.original_text = 'Тестовое слово'
      #   # jsondata = card.to_json
      #   # patch :update, card.to_json #, jsondata.merge({:id => card.id})
      #   post :update
      #   # patch action: 'update', controller: "api/v1/cards"

      #   card_new = Card.last
      #   expect(card_new.original_text).to eq('Тестовое слово')
      # end
    end

    describe 'create' do
      # it 'success create' do
      #   @request.headers['Content-Type'] = 'application/vnd.api+json'

      #   card = Card.new(original_text: 'Тестовое слово',
      #                      translated_text: 'house',
      #                      interval: 1,
      #                      repeat: 1,
      #                      efactor: 2.5,
      #                      quality: 5,
      #                      attempt: 1,
      #                      review_date: Time.now,
      #                      api_flashcards_user_id: user.id)

      #   json = {card: {original_text: 'Тестовое слово' } }
      #   post :create, json.to_json

      #   expect(Card.count).to eq(11)
      # end
    end
  end
end
