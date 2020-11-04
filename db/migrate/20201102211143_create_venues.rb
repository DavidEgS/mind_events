class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address_line_one
      t.string :address_line_two
      t.string :town
      t.string :county
      t.string :postcode

      t.timestamps
    end
  end
end
