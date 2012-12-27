# encoding: utf-8
class Letter < ActiveRecord::Base
  attr_accessible :body, :inline_image, :lang, :attachments_attributes, :distribution_id, :user_id, :remove_inline_image
  has_many :attachments, :as => :attachable, :dependent => :destroy
  belongs_to :user
  belongs_to :distribution
  has_many :mailing_recipients, :dependent => :destroy
  accepts_nested_attributes_for :attachments
  mount_uploader :inline_image, ImageUploader
  validates_uniqueness_of :distribution_id, :scope => :lang
  validates_presence_of :user_id
  validates_presence_of :distribution_id
  default_scope order(:created_at)

  def recipients
    res = []
    self.distribution.mailing_recipients.where(:letter_id => self.id).each do |mr|
      res << mr.recipient
    end
    res
  end

  def update_mailing_recipients
    self.distribution.mailing_recipients.where(:letter_id => nil).each do |mr|
      mr.update_attribute(:letter_id, self.id ) if mr.recipient.lang == self.lang
    end
  end
end
