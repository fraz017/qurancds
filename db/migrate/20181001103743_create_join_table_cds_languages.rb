class CreateJoinTableCdsLanguages < ActiveRecord::Migration[5.2]
  def change
    create_join_table :cds, :languages do |t|
      t.index [:cd_id, :language_id]
      t.index [:language_id, :cd_id]
    end
  end
end
