class ParsingMoviesWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(movies_url)
    ps = ParseService.new(movies_url)
    ps.call
  end
end