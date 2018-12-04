class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :likes
  has_many :comments
  has_many :checkins

  def checked_in?(event)
    checkin = Checkin.find_by(user: self, event: event)

    if checkin
      return true
    else
      return false
    end
  end
end
