class AddTimestampsToGuests < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :created_at, :datetime
    add_column :guests, :updated_at, :datetime
  end
end
