class CreateHotel < ActiveRecord::Migration[5.2]
  def change
    create_table :hotels do |t|
      t.string :name
      t.boolean :vacancy
      t.integer :occupancy
      t.datetime :opening_day
      t.datetime :newest_check_in
    end
  end
end
