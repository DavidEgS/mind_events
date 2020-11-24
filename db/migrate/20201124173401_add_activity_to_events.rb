class AddActivityToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :activity, :string
  end
end
