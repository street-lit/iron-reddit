class Link < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  validates :url, length: { minimum: 8, message: "Must be at least 8 characters" }
end
