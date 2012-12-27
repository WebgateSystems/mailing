# encoding: utf-8
class Status < ActiveRecord::Base
  attr_accessible :title
  validates_uniqueness_of :title
  validates_presence_of :title

  def find_or_create_by_title(title)
    status = Status.find_by_title(title)
    Status.create(title) unless status
    status
  end
end
