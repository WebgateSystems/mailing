# encoding: utf-8
class Letter < ActiveRecord::Base
  attr_accessible :subject, :body, :inline_image, :lang, :attachments_attributes, :distribution_id, :user_id, :remove_inline_image
  attr_encrypted :subject, :key => :encryption_key, :algorithm => 'aes-256-cbc', :charset => :default
  attr_encrypted :body, :key => :encryption_key, :algorithm => 'aes-256-cbc', :charset => :default

  has_many :attachments, :as => :attachable, :dependent => :destroy
  belongs_to :user
  belongs_to :distribution
  has_many :mailing_recipients, :dependent => :destroy
  accepts_nested_attributes_for :attachments, :allow_destroy => true
  mount_uploader :inline_image, ImageUploader
  validates_uniqueness_of :distribution_id, :scope => :lang
  validates_presence_of :user_id
  validates_presence_of :distribution_id
  default_scope order(:created_at)

  after_create :update_mailing_recipients

  def send_for_all_recipients(user)
    user.set_default_mailer
    c = user.user_config
    letter = self
    @mail = Mail.new do
      to "jerzy.sladkowski@gmail.com"
      sender "sladkowski@webgate.pro"
      subject "test"
    end

    #self.recipients.each do |r|
    #  @mail = Mail.new do
    #    to r.email
    #    from [c.name, c.surname].join(" ")+" <#{user.email}>"
    #    subject letter.subject
    #    unless letter.inline_image.blank?
    #      @mail.add_file(Rails.root.to_s + "/public" + letter.inline_image.url)
    #      cid = @mail.parts.last.content_id.gsub(/<|>/, "")
    #      html_part = Mail::Part.new do
    #        content_type 'text/html; charset=UTF-8'
    #        body "<img src='cid:#{cid}'>"
    #      end
    #      @mail.html_part = html_part
    #    else
    #      body letter.body
    #    end
    #  end
      letter.attachments.each do |a|
        @mail.add_file(Rails.root.to_s + "/public" + a.file_url)
      end
      @mail.deliver!
      #sleep rand(5..15)
    #end
  end

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

  protected

  def encryption_key
    self.user.encryption_key
  end

end
