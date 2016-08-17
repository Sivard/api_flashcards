require 'rails_helper'
include AuthHelper

module ApiFlashcards
  RSpec.describe BaseController, type: :controller do
    routes { ApiFlashcards::Engine.routes }


    describe "GET #index" do
      let!(:user) { create(:api_flashcards_user) }

      before(:each) do
        http_login
        visit root_path
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
        expect(user.email).to eq('email')
      end

      it 'return page text' do
        http_login
        visit root_path
        expect(page).to have_content 'Welcome to api_flashcards!'
      end
    end

  end
end
