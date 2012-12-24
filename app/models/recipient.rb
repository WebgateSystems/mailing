class Recipient < ActiveRecord::Base
  attr_accessible :email, :gender, :lang, :name, :patronymic, :surname, :salutation
  validates_uniqueness_of :email
  validates :email, :presence => true, :email => true
  has_many :distributions, :through => :mailing_recipients
  has_many :mailing_recipients
end
