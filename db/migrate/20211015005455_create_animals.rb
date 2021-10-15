class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name
      t.boolean :has_covid
      t.integer :age
      t.timestamps
      t.references :zoo, foreign_key: true
    end
  end
end
