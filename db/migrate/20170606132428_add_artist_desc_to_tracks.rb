class AddArtistDescToTracks < ActiveRecord::Migration[5.0]
  def change
    add_column :tracks, :artist_description, :text
  end
end
