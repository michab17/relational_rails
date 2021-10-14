class RemoveOpeningDayFromZoos < ActiveRecord::Migration[5.2]
  def change
    remove_column :zoos, :opening_day, :datetime
  end
end
