class Event < ApplicationRecord
  has_many :likes
  has_many :comments
  has_many :checkins
end
