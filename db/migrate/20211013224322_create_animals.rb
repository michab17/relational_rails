class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name
      t.boolean :has_covid
      t.integer :age
      t.datetime :day_added
      t.datetime :release_date
    end
  end
end
