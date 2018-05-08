class User < ApplicationRecord
  #validates :username, uniqueness: true
  has_many :messages
  has_many :rooms, through: :messages
end
