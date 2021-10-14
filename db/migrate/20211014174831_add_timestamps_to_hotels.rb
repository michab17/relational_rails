class AddTimestampsToHotels < ActiveRecord::Migration[5.2]
  def change
    add_column :hotels, :created_at, :datetime
    add_column :hotels, :updated_at, :datetime
  end
end
