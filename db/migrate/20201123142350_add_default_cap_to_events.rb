class AddDefaultCapToEvents < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :capacity, :integer, default: 99
  end
end
