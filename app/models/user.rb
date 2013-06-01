class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :hash_pwd, :salt_pwd, :username, :password, :password_confirmation
  
  validates_uniqueness_of :username
  
  has_many :memberships
  
end
