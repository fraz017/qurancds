class CreateJoinTableCdsSpeakers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :cds, :speakers do |t|
      t.index [:cd_id, :speaker_id]
      t.index [:speaker_id, :cd_id]
    end
  end
end
