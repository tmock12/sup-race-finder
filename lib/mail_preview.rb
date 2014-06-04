if Rails.env.development?
  class MailPreview < ActionMailer::Preview

    def activated
      race = Fabricate.create(:race)
      RaceMailer.activated(race)
    end

  end
end
