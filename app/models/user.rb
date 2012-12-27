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
end
