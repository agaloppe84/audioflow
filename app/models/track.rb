class Track < ApplicationRecord
  belongs_to :category
  has_many :votes
  has_attachment :audio
  has_attachment :photo

  def set_to_played
    self.play_count += 1
    self.save
  end

end
