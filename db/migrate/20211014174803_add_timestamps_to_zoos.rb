class AddTimestampsToZoos < ActiveRecord::Migration[5.2]
  def change
    add_column :zoos, :created_at, :datetime
    add_column :zoos, :updated_at, :datetime
  end
end
