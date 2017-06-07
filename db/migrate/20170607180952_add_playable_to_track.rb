class AddPlayableToTrack < ActiveRecord::Migration[5.0]
  def change
    add_column :tracks, :playable_at, :date
  end
end
