class MoviesController < ApplicationController
  MOVIES_URL = 'https://rb7.ru/afisha/movies'.freeze

  before_action :set_movies, only: [:index, :data]

  def index
    if @movies.length > 0
      redirect_to movies_data_path
    else
      render :index
    end
  end

  def data; end

  def load
    ParsingMoviesWorker.perform_async(MOVIES_URL)
    redirect_to movies_data_path, notice: 'Movies are being uploaded...'
  end

  private

  def set_movies
    @movies = Movie.today_top_3
  end
end
