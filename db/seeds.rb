# encoding: utf-8
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

puts 'Load default languages'
@lang = Language.find_or_create_by_iso('en')
@lang.update_attributes(long: "english", human: "English")
@lang = Language.find_or_create_by_iso('pl')
@lang.update_attributes(long: "polish", human: "Polski")
@lang = Language.find_or_create_by_iso('ru')
@lang.update_attributes(long: "russian", human: "Русский")
@lang = Language.find_or_create_by_iso('ua')
@lang.update_attributes(long: "ukrainian", human: "Українська")
puts 'Loaded default languages'

unless Distribution.find_by_title("Test mailing")
  puts 'Create test mailing...'
  @distribution = Distribution.create(title: "Test mailing", user_id: @user.id, status_id: @status.id)
  puts 'created.'

  puts 'Create recipients...'
  #:email, :gender, :lang, :name, :patronymic, :surname, :salutation
  r1 = Recipient.create(user_id: @user.id, email: "sysadm@op.pl", lang: 'pl', name: "Bronisław", surname: "Komorowski", salutation: "Pan")
  r2 = Recipient.create(user_id: @user.id, email: "biuro@webgate.pro", lang: 'en', name: "Barak", surname: "Obama", salutation: "Mr. President")
  r3 = Recipient.create(user_id: @user.id, email: "iphanter@mail.ru", lang: 'ru', name: "Иван", patronymic: 'Иванович', surname: "Охлобыстин", salutation: "проф.")
  puts 'created.'

  puts 'Add recipients to distribution'
  @distribution.recipients = [r1, r2, r3]
  puts 'added.'

  puts 'Create test letters...'
  # :body, :inline_image, :lang, :attachments_attributes, :distribution_id
  Letter.create(user_id: @user.id, subject: "Only test", body: "Test message body", lang: 'en', distribution_id: @distribution.id)
  Letter.create(user_id: @user.id, subject: "Po prostu test", body: "Zawartość testowego mailu", lang: 'pl', distribution_id: @distribution.id)
  Letter.create(user_id: @user.id, subject: "Просто тест", body: "Тело тестового сообщения", lang: 'ru', distribution_id: @distribution.id)
  puts 'created.'
end
