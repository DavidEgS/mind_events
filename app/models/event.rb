class Event < ApplicationRecord
  belongs_to :venue
  has_many :event_users
  has_many :users, through: :event_users

end
