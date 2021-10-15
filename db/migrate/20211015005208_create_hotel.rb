class CreateHotel < ActiveRecord::Migration[5.2]
  def change
    create_table :hotels do |t|
      t.string :name
      t.boolean :vacancy
      t.integer :occupancy

      t.timestamps
    end
  end
end
