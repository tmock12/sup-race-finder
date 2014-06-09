class ClassifiedMailer < ActionMailer::Base
  default from: 'no-reply@supracefinder.com'

  def new_classified(classified)
    @classified = classified
    mail(to: classified.email, subject: "#{classified.title} Classified")
  end

  def contact_message(classified_message)
    @classified = Classified.find(classified_message.classified_id)
    @message = classified_message
    mail(to: @classified.email,
         reply_to: @message.email,
         subject: "#{@classified.title} Classified Message")
  end
end
