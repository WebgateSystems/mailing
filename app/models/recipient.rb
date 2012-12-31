# encoding: utf-8
class Recipient < ActiveRecord::Base
  attr_accessible :email, :gender, :lang, :name, :patronymic, :surname, :salutation, :user_id
  attr_encrypted :email, :key => :encryption_key, :algorithm => 'aes-256-cbc', :charset => :default
  attr_encrypted :name, :key => :encryption_key, :algorithm => 'aes-256-cbc', :charset => :default
  attr_encrypted :surname, :key => :encryption_key, :algorithm => 'aes-256-cbc', :charset => :default

  validates_presence_of :user_id
  validates :email, :presence => true, :email => true
  has_many :distributions, :through => :mailing_recipients
  has_many :mailing_recipients
  belongs_to :user
  default_scope order(:created_at)

  def self.gender_char(gender)
    return "m" if gender =~ /male|m|man|mężczyzna|мужчина|м|муж/
    return "f" if gender =~ /female|f|woman|w|lady|kobieta|k|женщина|ж|жен/
    gender
  end

  def update_mailing_recipients
    self.mailing_recipients.each do |mr|
      letter = Letter.find_by_distribution_id_and_lang(mr.distribution_id, mr.recipient.lang)
      mr.update_attribute(:letter_id, letter.id) if letter
    end
  end

  protected

  def encryption_key
    self.user.encryption_key
  end

end
