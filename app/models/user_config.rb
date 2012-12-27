# encoding: utf-8
class UserConfig < ActiveRecord::Base
  attr_accessible :lang, :login, :password, :port, :server, :user_id
  belongs_to :user

  validates_presence_of :user_id, :lang, :login, :password, :port, :server
end
