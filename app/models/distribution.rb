class Distribution < ActiveRecord::Base
  attr_accessible :status_id, :title
  belongs_to :status
  has_many :letters
  has_many :recipients, :through => :mailing_recipients
  has_many :mailing_recipients
end
