class MoviesController < ApplicationController

  def index
    if !params[:rating].blank?
      @movies = Movie.rating_filter(params[:rating])
      respond_to do |f|
        f.html
        f.json {renger json: @movies}
      end
    else
      @movies = Movie.all
    end

  end


  def show
    @movie = Movie.find(params[:id])
  end


end
