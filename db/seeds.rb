# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Load default statuses'
Status.find_or_create_by_title("New")
Status.find_or_create_by_title("Sending")
Status.find_or_create_by_title("Hold")
Status.find_or_create_by_title("Canceled")
Status.find_or_create_by_title("Complete")
Status.find_or_create_by_title("Error")
Status.find_or_create_by_title("Waiting")
Status.find_or_create_by_title("Archive")
puts 'Loaded default statuses'

unless Distribution.find_by_title("Test mailing")
  puts 'Create test mailing...'
  Distribution.create(:title => "Test mailing")
  puts 'created.'

  puts 'Create recipients...'
  #:email, :gender, :lang, :name, :patronymic, :surname, :salutation
  Recipient.create(email: "jerzy.sladkowski@gmail.com", lang: 'pl', name: "Jerzy", surname: "Sładkowski", salutation: "Pan")
  Recipient.create(email: "sladkowski@webgate.pro", lang: 'en', name: "Jerzy", surname: "Sladkowski", salutation: "mgr")
  Recipient.create(email: "iphanter@mail.ru", lang: 'ru', name: "Иван", patronymic: 'Иванович', surname: "Охлобыстин", salutation: "проф.")
  puts 'created.'

  puts 'Create test letters...'
  # :body, :inline_image, :lang, :attachments_attributes, :distribution_id
  Letter.create(body: "Test message body", lang: 'en')
  Letter.create(body: "Zawartość testowego mailu", lang: 'pl')
  Letter.create(body: "Тело тестового сообщения", lang: 'ru')
  puts 'created.'

  puts 'Add recipients to test mailing...'
  Distribution.first.recipients << Recipient.all
  puts 'added.'
end
