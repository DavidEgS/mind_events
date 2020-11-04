class AddFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :phone_number, :string
    add_column :users, :postcode, :string
    add_column :users, :admin, :boolean, default: false
    add_column :users, :coc, :boolean, default: false
    add_column :users, :dpn, :boolean, default: false
  end
end
