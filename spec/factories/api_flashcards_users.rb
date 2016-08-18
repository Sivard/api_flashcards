FactoryGirl.define do
  factory :user, class: 'ApiFlashcards::User' do
    email    'email'
    password '1234'
  end
end
