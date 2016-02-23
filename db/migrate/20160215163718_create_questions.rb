class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question
      t.text :answer
      t.string :asker
      t.string :email
      t.datetime :date
      t.string :title
      t.belongs_to :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
