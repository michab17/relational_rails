class RemoveDayAddedFromAnimals < ActiveRecord::Migration[5.2]
  def change
    remove_column :animals, :day_added, :datetime
  end
end
