class RemoveAnimalAddedFromZoos < ActiveRecord::Migration[5.2]
  def change
    remove_column :zoos, :animal_added, :datetime
  end
end
