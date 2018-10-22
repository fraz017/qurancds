class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.string :email
      t.text :comment
      t.float :points
      t.belongs_to :cd, foreign_key: true

      t.timestamps
    end
  end
end
