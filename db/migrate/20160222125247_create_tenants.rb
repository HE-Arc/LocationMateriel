class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :lastname
      t.string :firstname
      t.string :address
      t.string :city
      t.string :npa
      t.string :email
      t.date :date_start
      t.date :date_end
      t.text :utilisation
      t.belongs_to :product, index:true, foreign_key:true

      t.timestamps null: false
    end
  end
end
