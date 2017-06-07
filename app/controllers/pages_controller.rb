class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @track = Track.all.where(playable_at: Date.today).last
    @tomorrow_track = Track.all.where(playable_at: (Date.tomorrow)).last
    @number = rand(0..5)
    @colors = {}
    @user = current_user
    @colors[:first] = dynamic_color(@number)
    @colors[:second] = dynamic_color_lighter(@number)
  end
end
