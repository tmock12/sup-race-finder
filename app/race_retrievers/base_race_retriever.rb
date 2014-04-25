class BaseRaceRetriever
  require 'open-uri'

  def self.retrieve
    new
  end

  def initialize
    get_races
  end

  def page
    @page ||= Nokogiri::HTML(open(url))
  end

  def url
    raise NotImplementedError
  end
end
