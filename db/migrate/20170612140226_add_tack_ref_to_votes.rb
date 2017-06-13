class AddTackRefToVotes < ActiveRecord::Migration[5.0]
  def change
    add_reference :votes, :track, foreign_key: true
  end
end
