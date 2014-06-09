class ClassifiedMessagesController < ApplicationController
  respond_to :html

  def create
    @classified = Classified.find(classified_message_params[:classified_id])
    @classified_message = ClassifiedMessage.new(classified_message_params)
    if @classified_message.save
      render nothing: true
    else
      render partial: 'classifieds/message_form', status: :unprocessable_entity
    end
  end

  protected

  def classified_message_params
    params.require(:classified_message).permit(:name, :email, :message, :classified_id)
  end
end
