# encoding: utf-8
class MailingRecipient < ActiveRecord::Base
  attr_accessible :distribution_id, :recipient_id, :email_status_id, :letter_id
  validates_uniqueness_of :distribution_id, :scope => :recipient_id
  belongs_to :distribution
  belongs_to :recipient
  belongs_to :letter
  before_create :set_letter

  def set_letter
    letter = self.distribution.letters.where(:lang => self.recipient.lang).first
    self.letter_id=letter.id if letter
  end
end
