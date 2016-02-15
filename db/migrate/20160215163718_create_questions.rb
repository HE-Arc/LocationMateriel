class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.string :asker
      t.datetime :date
      t.string :title
      t.belongs_to :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
