class MoviesController < ApplicationController

  def index
    if !params[:rating].blank?
      @movies = Movie.rating_filter(params[:rating])
    else
      @movies = Movie.all
    end
		respond_to do |f|
			f.html
			f.json {render json: @movies}
		end
  end
	
	
  def show
		@movie = Movie.find(params[:id])
		respond_to do |f|
			f.html {render :show}
			f.json {render json: @movie}
		end
  end


end
