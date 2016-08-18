ApiFlashcards::Engine.routes.draw do
  root to: "base#index"

  get 'base/index'

  namespace :api do
    namespace :v1 do
      resources :cards, defaults: { format: 'json' }
    end
  end
end
