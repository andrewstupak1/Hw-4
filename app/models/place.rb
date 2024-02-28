class Place < ApplicationRecord
  belongs_to :user
  has_many :entries
end

#added while debugging - read online 