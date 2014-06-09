class ClassifiedMailer < ActionMailer::Base
  default from: 'no-reply@supracefinder.com'

  def new_classified(classified)
    @classified = classified
    mail(to: classified.email, subject: "#{classified.title} Classified")
  end
end
