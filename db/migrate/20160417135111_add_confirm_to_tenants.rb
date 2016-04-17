class AddConfirmToTenants < ActiveRecord::Migration
  def change
    add_column :tenants, :confirm_location, :integer, default: 0
  end
end
