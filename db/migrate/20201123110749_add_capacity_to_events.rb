class AddCapacityToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :capacity, :integer
  end
end
