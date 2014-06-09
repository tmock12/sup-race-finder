if Rails.env.development?
  class MailPreview < ActionMailer::Preview

    def activated
      race = Fabricate.create(:race)
      RaceMailer.activated(race)
    end

    def new_classified
      classified = Fabricate(:classified)
      ClassifiedMailer.new_classified(classified)
    end

  end
end
