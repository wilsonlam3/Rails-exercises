class MovieController < ApplicationController
  def index
  	@movie = Movie.all
  end

end
