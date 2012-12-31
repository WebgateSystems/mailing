# encoding: utf-8
class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :email, :password, :password_confirmation, :admin

  validates :email, :presence => true, :email => true
  validates_uniqueness_of :email
  validates_confirmation_of :password
  validates_presence_of :password

  has_many :distributions
  has_many :letters
  has_many :recipients
  has_one :user_config, :dependent => :destroy
  after_create :set_encryption_salt

  def set_encryption_salt
    self.update_attribute(:encryption_salt, rand(2**256).to_s(36)[0..20])
  end

  def encryption_key
    APP_CONFIG['encryption_key'] + self.encryption_salt
  end

  def set_default_mailer
    c = self.user_config
    smtp_config = { address: c.server, port: c.port, domain: APP_CONFIG['domain'], authentication: c.auth,
                    enable_starttls_auto: c.starttls, tls: c.tls, ssl: c.ssl, openssl_verify_mode: c.openssl_verify_mode,
                    user_name: c.login, password: c.password }
    Mail.defaults do
      delivery_method :smtp, smtp_config
    end
  end

end
