class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :name
      t.belongs_to :cd

      t.timestamps
    end
  end
end
