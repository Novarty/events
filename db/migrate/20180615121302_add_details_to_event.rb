class AddDetailsToEvent < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :start_time, :datetime
    remove_column :events, :place, :string

    add_column :events, :description, :text
    add_column :events, :start_date, :datetime
    add_column :events, :finish_date, :datetime
  end
end
