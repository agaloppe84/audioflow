class VotesController < ApplicationController
  before_action :find_track, only: [ :create ]
  skip_before_action :authenticate_user!, only: [:create]

  def new
    @vote = Vote.new
  end

  def create
    @vote = @track.votes.build(vote_params)
    if @vote.save
    @good_votes_form = (@track.votes.where(status: "Like")).count
    @bad_votes_form = (@track.votes.where(status: "Dislike")).count
      respond_to do |format|
        format.html { redirect_to track_path(@track) }
        format.js  # <-- will render `app/views/scores/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'tracks/show' }
        format.js  # <-- idem
      end
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:status, :track_id)
  end
  def find_track
    @track = Track.find(params[:track_id])
  end


end
