class DistressedMulletRaceRetriever < BaseRaceRetriever

  def url
    'http://distressedmullet.com/calendar'
  end

  def get_races
    page.css(".view-race-calendar .views-row").each do |race|
      title = race.at_css('.views-field-title').text.strip
      date = race.at_css('.date-display-single').text + '.2014'
      city = race.at_css('.views-field-field-city').text.strip
      state = race.at_css('.views-field-field-state').text.strip
      url = get_race_url(race.at_css('.views-field-title a')[:href])
      new_race = Race.create(
        title: title,
        date: Date.strptime(date, "%m.%d.%Y"),
        city: city,
        state: state,
        url: url,
        email: 'taylor@hashrocket.com'
      )
      sleep(2.seconds)
    end
  end

  private

  def get_race_url(mullet_url)
    begin
      Nokogiri::HTML(open("http://distressedmullet.com" + mullet_url)).at_css('.field-name-field-website-url a')[:href]
    rescue
      nil
    end
  end
end
