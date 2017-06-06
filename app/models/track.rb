class Track < ApplicationRecord
  belongs_to :category
  has_attachment :audio
  has_attachment :photo
end
