class PaddleGuruRetriever < BaseRaceRetriever

  def url
    'https://paddleguru.com/races'
  end

  def get_races
    page.css("table#upcoming-regattas tbody tr").each do |race|
      date = race.at_css('.date').text
      title = race.at_css('.title').text
      city = race.at_css('.location').text.split(',')[0...-1].join(', ')
      state = race.at_css('.location').text.split(',').last.strip
      url = ("https://paddleguru.com" + race.at_css('.title a')[:href])
      new_race = Race.create(
        title: title,
        date: Date.strptime(date, "%m/%d/%Y"),
        city: city,
        state: state,
        url: url,
        email: 'taylor@hashrocket.com'
      )
    end
  end
end
