class RemoveReleaseDateFromAnimals < ActiveRecord::Migration[5.2]
  def change
    remove_column :animals, :release_date, :datetime
  end
end
