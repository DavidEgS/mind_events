class Event < ApplicationRecord
  belongs_to :venue
  has_many :event_users
  has_many :users, through: :event_users

  def full?
      event_users.count >= capacity
  end

  def instance_csv
    CSV.generate do |csv|
      csv << ["Name", "Surname", "Phone Number", "Postcode"]
      event_users.each do |event_user|
        csv << [event_user.user.name, event_user.user.surname, event_user.user.phone_number, event_user.user.postcode]
      end
    end
  end
end
