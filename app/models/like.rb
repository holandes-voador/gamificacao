class Like < ApplicationRecord
  belongs_to :user
  belongs_to :event, optional: true
  belongs_to :notice, optional: true
end
