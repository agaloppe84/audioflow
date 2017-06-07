class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!


  def dynamic_color(random_number)
    colors = ["#FF5855", "#FFBA55", "#57EACA", "#57CDEA", "#5796EA", "#EA577B"]
    number = random_number
    colors[number]
  end

  def dynamic_color_lighter(random_number)
    colors_lighter = ["#FF9896", "#FFD699", "#AEFFED", "#98E6FA", "#9FC8FF", "#FDA3B9"]
    number = random_number
    colors_lighter[number]
  end

  def weekly_songs
    @number = 0
    @day = DateTime.now.day
    @id = @day
    @tracks = Track.all
    @track = @tracks.find(@id - (@id - @tracks.count))

  end


end
