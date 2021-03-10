require 'nokogiri'
require 'open-uri'

class ParseService
  def initialize(movies_url)
    @movies_url = movies_url
    @doc = nil
  end

  def call
    get_doc
    parse_movies
  end

  private

  def get_doc
    @doc = Nokogiri::HTML(URI.open(@movies_url))
  end

  def parse_movies
    @doc.css('div.movie').each do |movie|
      puts "#{extract_title(movie)} -> #{count_sessions(movie)}"
      Movie.create(title: extract_title(movie), sessions: count_sessions(movie))
    end
  end

  def extract_title(movie)
    movie.css('div.data h2>a').text
  end

  def count_sessions(movie)
    movie.css('table.afisha-schedule td.when div.show').length
  end
end