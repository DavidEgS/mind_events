class AddAttendedToEventusers < ActiveRecord::Migration[6.0]
  def change
    add_column :event_users, :attended, :boolean, default: false
  end
end
