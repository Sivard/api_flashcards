require 'nokogiri'
require 'open-uri'


user = ApiFlashcards::User.build(email: 'example@mail.ru', password: '1234')
puts user.save
doc = Nokogiri::HTML(open('https://www.learnathome.ru/blog/100-beautiful-words'))

doc.search('//table/tbody/tr').each do |row|
  original = row.search('td[2]')[0].content.downcase
  translated = row.search('td[4]')[0].content.downcase
  user.cards.create(original_text: original, translated_text: translated, user_id: user.id)
end