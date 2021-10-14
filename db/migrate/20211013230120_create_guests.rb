class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :name
      t.boolean :royalty_member
      t.integer :room_number
      t.datetime :check_in
      t.datetime :expected_check_out
    end
  end
end
