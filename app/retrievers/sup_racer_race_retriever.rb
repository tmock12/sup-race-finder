class SupRacerRaceRetriever < BaseRaceRetriever

  def url
    'http://www.supracer.com/calendar/'
  end

  def get_races
    page.css("tbody.row-hover tr").each do |race|
      date = race.at_css('.column-1').text
      title = race.at_css('.column-2').text
      city = race.at_css('.column-3').text
      state = race.at_css('.column-4').text
      country = race.at_css('.column-5').text
      url = race.at_css('.column-2').children.last[:href]
      Race.create(
        title: title,
        date: Date.strptime(date, "%m/%d/%Y"),
        city: city,
        state: state,
        country: country,
        url: url
      ).activate!
    end
  end
end
