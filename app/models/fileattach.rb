# encoding: utf-8
class Fileattach < ActiveRecord::Base
  belongs_to :attachable
  attr_accessible :description, :file
end
