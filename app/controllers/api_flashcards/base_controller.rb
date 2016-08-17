require_dependency "api_flashcards/application_controller"

module ApiFlashcards
  class BaseController < ApplicationController
    def index
      render text: 'Welcome to api_flashcards!'
    end
  end
end
