# frozen_string_literal: true

class MoviesController < ApplicationController
  MOVIES_URL = 'https://rb7.ru/afisha/movies'

  before_action :set_movies, only: %i[index data]

  def index
    if @movies.length.positive?
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
    @movies = Movie.today_top(3)
  end
end
