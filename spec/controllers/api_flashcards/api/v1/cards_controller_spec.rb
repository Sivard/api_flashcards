require 'rails_helper'

module ApiFlashcards
  RSpec.describe Api::V1::CardsController, type: :controller do
    routes { ApiFlashcards::Engine.routes }

    let(:user) { create(:user) }
    before do
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
      it 'success update' do
        card = Card.last
        card.original_text = 'Тестовое слово'
        post "/api/v1/cards/#{card.id}", card.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

        card_new = Card.last
        expect(card_new.original_text).to eq('Тестовое слово')
      end
    end

    # it 'GET index' do
    #   # expect(Card.count).to eq(1)
    #   get '/api_flashcards/api/v1/cards'

    #   expect(response.code).to eq("200")

    #   # # expect(page).to have_content 'Ожидайте наступления даты пересмотра.'

    #   # json = JSON.parse(response.body)

    #   # test for the 200 status-code
    #   # expect(response).to be_success

    #   # check to make sure the right amount of messages are returned
    #   # expect(json['messages'].length).to eq(10)
    # end

    # it 'PUT update' do
    #   card = user.cards.first
    #   controller.stub(current_user: user)
    #   put "/api_flashcards/api/v1/cards/#{card.id}"
    # end
    end
end
