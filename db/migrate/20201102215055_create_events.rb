class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.datetime :date
      t.references :venue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
