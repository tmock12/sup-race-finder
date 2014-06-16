task :deploy_races => :environment do
  uri = URI.parse("http://supracefinder.com/api/races.json")
  Race.all.each do |race|
    race_json = {
      title: race.title,
      date: race.date,
      city: race.city,
      state: race.state,
      country: race.country,
      url: race.url,
      latitude: race.latitude,
      longitude: race.longitude,
      active: race.active,
      email: race.email
    }
    Net::HTTP.post_form(uri, race_json)
  end
end
