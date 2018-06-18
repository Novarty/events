class ChangeDataTypeOfColumnForMembers < ActiveRecord::Migration[5.2]
  def change
    change_column :members, :phone, :string, :limit => 15
  end
end
