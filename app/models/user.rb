class User < ActiveRecord::Base
  has_many :links
  has_many :votes
  has_secure_password
end
