class RaceMailer < ActionMailer::Base
  default from: 'no-reply@supracefinder.com'

  def activated(race)
    @race = race
    mail(to: race.email, subject: "#{race.title} Race")
  end
end
