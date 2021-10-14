class RemoveExpectedCheckOutFromGuests < ActiveRecord::Migration[5.2]
  def change
    remove_column :guests, :expected_check_out, :datetime
  end
end
