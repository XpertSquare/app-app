class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :username, :password, :password_confirmation, :email, :display_name 
  
  validates_uniqueness_of :username
  validates_presence_of :username, :password, :on => :create

  
  has_many :memberships
  has_many :accounts, :through => :memberships, :dependent => :destroy
  
  before_create  { generate_token(:auth_token) }
  
  after_validation { self.errors.messages.delete(:password_digest) }
    
  
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
  
  def generate_password
     @char_map =  [('a'..'z'),('A'..'Z'), (0..9)].map{|i| i.to_a}.flatten
     self.password = (0...10).map{ @char_map[rand(@char_map.length)] }.join
  end
  
end
