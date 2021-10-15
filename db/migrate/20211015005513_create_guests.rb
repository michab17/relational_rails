class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :name
      t.boolean :royalty_member
      t.integer :room_number
      t.timestamps
      t.references :hotel, foreign_key: true
    end
  end
end
