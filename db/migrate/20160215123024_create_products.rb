class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :renter
      t.date :date_start
      t.date :date_end
      t.text :condition
      t.timestamps null: false
      t.belongs_to :users, index:true
    end
    add_index :products, :user_id
  end
end
