require 'rails_helper'

module ApiFlashcards
  RSpec.describe BaseController, type: :controller do
    routes { ApiFlashcards::Engine.routes }

    describe "GET #index" do
      before do
        visit root_path
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it 'return page text' do
        expect(page).to have_content 'Welcome to api_flashcards!'
      end
    end

  end
end
