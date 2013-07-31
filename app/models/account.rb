class Account < ActiveRecord::Base
  attr_accessible :name, :status, :email
  has_many :memberships
  has_many :services, dependent: :destroy
  has_many :users, :through => :memberships, :dependent => :destroy

  
  validates_presence_of :name
end
