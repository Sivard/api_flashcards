require 'rails_helper'

module ApiFlashcards
  RSpec.describe Api::V1::CardsController, type: :controller do
    let(:user) { create(:user) }
    before do
      10.times do
        create(:card, user: user)
      end

      page.driver.browser.authorize user.email, '1234'
    end

    describe 'index page list' do
      it 'get index' do
        visit api_v1_cards_path
      end
    end

    # before do
    #   @mock_controller = mock("ApplicationController") 
    #   @mock_controller.any_instance.stub(:current_user).and_return(User.first)
    # end

    # it 'GET index' do
    #   # expect(Card.count).to eq(1)
    #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    #   controller.stub_chain(:current_user, :cards).and_return(user.cards)
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
