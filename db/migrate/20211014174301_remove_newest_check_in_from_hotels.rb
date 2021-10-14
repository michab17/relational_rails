class RemoveNewestCheckInFromHotels < ActiveRecord::Migration[5.2]
  def change
    remove_column :hotels, :newest_check_in, :datetime
  end
end
