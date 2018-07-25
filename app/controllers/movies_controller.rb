class MoviesController < ApplicationController

  def index
    if !params[:rating].blank?
      @movies = Movie.rating_filter(params[:rating])
    else
      @movies = Movie.all
    end

  end


  def show
    @movie = Movie.find(params[:id])
  end


end
