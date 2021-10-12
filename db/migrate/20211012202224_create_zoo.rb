class CreateZoo < ActiveRecord::Migration[5.2]
  def change
    create_table :zoos do |t|
      t.string :name
      t.boolean :open
      t.integer :num_of_people
      t.datetime :opening_day
      t.datetime :animal_added
    end
  end
end
