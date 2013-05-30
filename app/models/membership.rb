class Membership < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :account
  belongs_to :user
end
