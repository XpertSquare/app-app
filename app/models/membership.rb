class Membership < ActiveRecord::Base
  attr_accessible :user_id, :account_id
  belongs_to :account
  belongs_to :user
end
