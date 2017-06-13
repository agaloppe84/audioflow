class Vote < ApplicationRecord
  belongs_to :track
  enum status: ['Like', 'Dislike']
end
