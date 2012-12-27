# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Create default user'
@user = User.find_by_email("biuro@webgate.pro")
@user ||= User.create(:email => 'biuro@webgate.pro', :password => 'admin', :password_confirmation => 'admin', :admin => true)
puts 'Default user created'

puts 'Load default statuses'
@status = Status.find_or_create_by_title("New")
Status.find_or_create_by_title("Sending")
Status.find_or_create_by_title("Hold")
Status.find_or_create_by_title("Complete")
Status.find_or_create_by_title("Error")
Status.find_or_create_by_title("Waiting")
Status.find_or_create_by_title("Canceled")
Status.find_or_create_by_title("Archive")
puts 'Loaded default statuses'

unless Distribution.find_by_title("Test mailing")
  puts 'Create test mailing...'
  @distribution = Distribution.create(title: "Test mailing", user_id: @user.id, status_id: @status.id)
  puts 'created.'

  puts 'Create recipients...'
  #:email, :gender, :lang, :name, :patronymic, :surname, :salutation
  Recipient.create(email: "sysadm@op.pl", lang: 'pl', name: "Bronisław", surname: "Komorowski", salutation: "Pan", user_id: @user.id)
  Recipient.create(email: "biuro@webgate.pro", lang: 'en', name: "Barak", surname: "Obama", salutation: "Mr. President", user_id: @user.id)
  Recipient.create(email: "iphanter@mail.ru", lang: 'ru', name: "Иван", patronymic: 'Иванович', surname: "Охлобыстин", salutation: "проф.", user_id: @user.id)
  puts 'created.'

  puts 'Create test letters...'
  # :body, :inline_image, :lang, :attachments_attributes, :distribution_id
  Letter.create(body: "Test message body", lang: 'en', distribution_id: @distribution.id, user_id: @user.id)
  Letter.create(body: "Zawartość testowego mailu", lang: 'pl', distribution_id: @distribution.id, user_id: @user.id)
  Letter.create(body: "Тело тестового сообщения", lang: 'ru', distribution_id: @distribution.id, user_id: @user.id)
  puts 'created.'
end
