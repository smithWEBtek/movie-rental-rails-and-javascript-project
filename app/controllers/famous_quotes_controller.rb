class FamousQuotesController < ApplicationController

  def new
    @movie = Movie.find_by(id: params[:movie_id])
    @famous_quote = FamousQuote.new
  end

  def create
    @famous_quote = Famous_quote.new(famous_quote_params)
    if @famous_quote.save
      @message = "Thank you for adding a quote to #{@famous_quote.movie.title}"
      redirect_to movie_path(@famous_quote.movie, :message => @message)
    else
      render :new
    end
  end

  private

  def famous_quote_params
    params.require(:famous_quote).permit(:quote, :actor, :movie_id)
  end
end
