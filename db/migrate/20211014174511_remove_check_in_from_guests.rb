class RemoveCheckInFromGuests < ActiveRecord::Migration[5.2]
  def change
    remove_column :guests, :check_in, :datetime
  end
end
