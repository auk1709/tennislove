class RamoveIconFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :icon, :string
    add_column :users, :image_name, :string
  end
end
