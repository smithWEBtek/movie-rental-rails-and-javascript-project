class MoviesController < ApplicationController

  def index
    if !params[:rating].blank?
      if params[:rating] == "G"
        @movies = Movie.where("rating = 'G'")
      elsif params[:rating] == "PG"
        @movies = Movie.where("rating = 'PG'")
      elsif params[:rating] == "PG-13"
        @movies = Movie.where("rating = 'PG-13'")
      elsif params[:rating] == "R"
        @movies = Movie.where("rating = 'R'")
      elsif params[:rating] == "NC-17"
        @movies = Movie.where("rating = 'NC-17'")
      end
    else
      @movies = Movie.all
    end

  end


  def show
    @movie = Movie.find(params[:id])
  end


end
