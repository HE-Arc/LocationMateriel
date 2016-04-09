class AddUsersIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :users_id, :integer
  end
end
