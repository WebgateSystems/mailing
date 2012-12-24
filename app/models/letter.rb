class Letter < ActiveRecord::Base
  attr_accessible :body, :inline_image, :lang, :attachments_attributes, :distribution_id
  has_many :attachments, :as => :attachable, :dependent => :destroy
  belongs_to :distribution
  has_many :mailing_recipients
  accepts_nested_attributes_for :attachments
  mount_uploader :inline_image, ImageUploader
  validates_uniqueness_of :distribution_id, :scope => :lang
end
