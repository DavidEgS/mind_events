class EventUser < ApplicationRecord
  belongs_to :User
  belongs_to :Events
end
