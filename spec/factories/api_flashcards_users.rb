FactoryGirl.define do
  factory :api_flashcards_user, class: 'ApiFlashcards::User' do
    email    'email'
    password '1234'
  end
end
