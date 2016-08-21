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

      request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user.email,'1234')
    end

    describe 'index page list' do
      before do
        get :index, {format: 'json'}
      end
      
      it 'check success response' do
        expect(response).to be_success
      end

      it 'check number objects' do
        json = JSON.parse(response.body)
        expect(json.length).to eq(10)
      end
    end

    describe 'update' do
      it 'success update' do
        card = Card.last
        patch :update, {format: 'json', id: card, card: FactoryGirl.attributes_for(:card, original_text: 'Тестовое слово')}

        card.reload
        expect(card.original_text).to eq('Тестовое слово')
      end
    end

    describe 'create' do
      it 'success create' do
        post :create, format: 'json', card: FactoryGirl.attributes_for(:card, original_text: 'Тестовое слово')
        expect(Card.count).to eq(11)
      end
    end
  end
end
