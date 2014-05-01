task :deploy_races => :environment do
  Race.all.each do |race|
    uri = URI.parse("http://quiet-journey-7381.herokuapp.com/api/races.json")
    Net::HTTP.post_form(uri, race.as_json)
  end
end
