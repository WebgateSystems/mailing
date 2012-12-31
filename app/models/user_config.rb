# encoding: utf-8
class UserConfig < ActiveRecord::Base
  attr_accessible :name, :surname, :lang, :login, :password, :password_confirmation, :port, :server, :auth, :starttls, :tls, :ssl, :openssl_verify_mode, :user_id

  attr_encrypted :name, :key => :encryption_key, :algorithm => 'aes-256-cbc', :charset => :default
  attr_encrypted :surname, :key => :encryption_key, :algorithm => 'aes-256-cbc', :charset => :default
  attr_encrypted :login, :key => :encryption_key, :algorithm => 'aes-256-cbc', :charset => :default
  attr_encrypted :password, :key => :encryption_key, :algorithm => 'aes-256-cbc', :charset => :default
  belongs_to :user

  validates_presence_of :user_id, :lang, :login, :port, :server
  validates :password, :presence =>true, :confirmation =>true

  protected

  def encryption_key
    self.user.encryption_key
  end

end
