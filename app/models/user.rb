class User < ActiveRecord::Base
  attr_accessible :hash_pwd, :salt_pwd, :username
  has_many :memberships
end
