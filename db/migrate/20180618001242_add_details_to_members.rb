class AddDetailsToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :phone, :integer
    add_column :members, :name, :string
  end
end
