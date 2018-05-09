class User < ApplicationRecord
  #validates :username, uniqueness: true
  has_many :messages
end
