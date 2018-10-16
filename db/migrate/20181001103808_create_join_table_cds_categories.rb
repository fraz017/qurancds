class CreateJoinTableCdsCategories < ActiveRecord::Migration[5.2]
  def change
    create_join_table :cds, :categories do |t|
      t.index [:cd_id, :category_id]
      t.index [:category_id, :cd_id]
    end
  end
end
