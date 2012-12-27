# encoding: utf-8
require 'csv'
class Distribution < ActiveRecord::Base
  attr_accessible :status_id, :title, :attachments_attributes, :user_id
  validates_presence_of :user_id
  belongs_to :user
  belongs_to :status
  has_many :letters
  has_many :recipients, :through => :mailing_recipients
  has_many :mailing_recipients
  has_many :attachments, :as => :attachable, :dependent => :destroy
  accepts_nested_attributes_for :attachments
  default_scope order(:created_at)

  def self.import_csv(attach, distribution_id, user_id)
    CSV.foreach("public"+attach.file_url) do |row|
      if row[0]
        r = Recipient.find_by_email row[0]
        lng = row[1] unless row[1].blank?
        lng ||= 'en'
        if r
          r.update_attributes(:salutation => row[2], :lang => lng, :gender => Recipient.gender_char(row[3]),
                              :name => row[4], :surname => row[5], :patronymic => row[6])
        else
          r = Recipient.create!(:email => row[0], :lang => lng, :salutation => row[2], :gender => Recipient.gender_char(row[3]),
                                :name => row[4], :surname => row[5], :patronymic => row[6], :user_id => user_id )
        end
        recipients = Distribution.find(distribution_id).recipients
        d.recipients << r unless recipients.detect(r)
        r.update_mailing_recipients
      end
    end
  end
end
