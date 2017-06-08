class TracksController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create, :show, :index, :edit, :update ]
  before_action :set_category

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
    @number = rand(0..5)
    @colors = {}
    @user = current_user
    @colors[:first] = dynamic_color(@number)
    @colors[:second] = dynamic_color_lighter(@number)
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

  def week
    @track_01 = Track.where(playable_at: (Date.today - 5.day)).last
    @track_02 = Track.where(playable_at: (Date.today - 4.day)).last
    @track_03 = Track.where(playable_at: (Date.today - 3.day)).last
    @track_04 = Track.where(playable_at: (Date.today - 2.day)).last
    @track_05 = Track.where(playable_at: (Date.today - 1.day)).last
    @week_tracks = [@track_01, @track_02, @track_03, @track_04, @track_05].compact
    @number = rand(0..5)
    @colors = {}
    @colors[:first] = dynamic_color(@number)
    @colors[:second] = dynamic_color_lighter(@number)
  end

  def week_show
    @track = Track.find(params[:id])
    @number = rand(0..5)
    @colors = {}
    @colors[:first] = dynamic_color(@number)
    @colors[:second] = dynamic_color_lighter(@number)
  end

  private

  def tracks_params
    params.require(:track).permit(:name, :artist, :category_id, :playable_at, :year, :audio)
  end

  def set_category
     @categories = Category.all
  end



end
