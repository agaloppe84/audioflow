class TracksController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create ]
  def new
    @track = Track.new
    @categories = Category.all
  end

  def create
    @track = Track.new(tracks_params)
    if @track.save
      redirect_to root_path, notice: "#{@track.name} à été crée"
    else
      render :new
    end
  end

  private

  def tracks_params
    params.require(:track).permit(:name, :artist, :category_id, :audio)
  end



end
