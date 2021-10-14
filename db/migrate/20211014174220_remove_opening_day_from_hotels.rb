class RemoveOpeningDayFromHotels < ActiveRecord::Migration[5.2]
  def change
    remove_column :hotels, :opening_day, :datetime
  end
end
