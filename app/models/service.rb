class Service < ActiveRecord::Base
  attr_accessible :description, :is_online_booking, :is_visible, :length, :name, :price, :acount_id
  
  belongs_to :account
  
end
