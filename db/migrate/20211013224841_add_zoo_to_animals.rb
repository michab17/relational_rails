class AddZooToAnimals < ActiveRecord::Migration[5.2]
  def change
    add_reference :animals, :zoo, foreign_key: true
  end
end
