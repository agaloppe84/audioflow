class AddPlayToTrack < ActiveRecord::Migration[5.0]
  def change
    add_column :tracks, :play_count, :integer, default: 0
  end
end
