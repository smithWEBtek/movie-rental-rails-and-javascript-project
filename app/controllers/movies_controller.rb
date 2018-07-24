class MoviesController < ApplicationController

  def index
    if !params[:rating].blank?
      if params[:rating] == "G"
        @movies = Movie.all.select { |m| m.rating == "G" }
      elsif params[:rating] == "PG"
        @movies = Movie.all.select { |m| m.rating == "PG" }
      elsif params[:rating] == "PG-13"
        @movies = Movie.all.select { |m| m.rating == "PG-13" }
      elsif params[:rating] == "R"
        @movies = Movie.all.select { |m| m.rating == "R" }
      elsif params[:rating] == "NC-17"
        @movies = Movie.all.select { |m| m.rating == "NC-17" }
      end
    else
      @movies = Movie.all
    end

  end


  def show
    @movie = Movie.find(params[:id])
  end


end
