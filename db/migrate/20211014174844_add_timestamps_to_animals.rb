class AddTimestampsToAnimals < ActiveRecord::Migration[5.2]
  def change
    add_column :animals, :created_at, :datetime
    add_column :animals, :updated_at, :datetime
  end
end
