class Account < ActiveRecord::Base
  attr_accessible :name, :status
  has_many :memberships
  
  validates_presence_of :name
end
