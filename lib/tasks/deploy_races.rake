task :deploy_races => :environment do
  uri = URI.parse("http://quiet-journey-7381.herokuapp.com/api/races.json")
  Race.all.each do |race|
    Net::HTTP.post_form(uri, race.as_json)
  end
end
