class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @track = Track.all.sample


    @number = rand(0..5)
    @colors = {}
    @colors[:first] = dynamic_color(@number)
    @colors[:second] = dynamic_color_lighter(@number)
  end
end
