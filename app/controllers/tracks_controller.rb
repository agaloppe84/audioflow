class TracksController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create, :show, :index, :edit, :update ]
  before_action :set_track

  def new
    @track = Track.new
  end

  def show
    @track = Track.all.where(playable_at: Date.today).last
    @number = rand(0..5)
    @colors = {}
    @colors[:first] = dynamic_color(@number)
    @colors[:second] = dynamic_color_lighter(@number)
  end

  def index
    @tracks = Track.order(:playable_at)
    @track = Track.all.where(playable_at: Date.today).last
  end

  def create
    @track = Track.new(tracks_params)
    if @track.save
      redirect_to root_path, notice: "#{@track.name} à été crée"
    else
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(tracks_params)
      redirect_to tracks_path
    else
      render :edit
    end
  end

  private

  def tracks_params
    params.require(:track).permit(:name, :artist, :category_id, :playable_at, :audio)
  end

  def set_track
     @categories = Category.all
  end



end
