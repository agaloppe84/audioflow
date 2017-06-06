class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.string :name
      t.string :year
      t.references :category, foreign_key: true
      t.string :artist
      t.string :duration

      t.timestamps
    end
  end
end
