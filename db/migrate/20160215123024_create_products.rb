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
    end
  end
end
