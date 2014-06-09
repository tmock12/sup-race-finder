class ClassifiedsController < ApplicationController
  respond_to :html
  expose(:classifieds) { Classified.order(created_at: :desc) }

  def new
    @classified = Classified.new
  end

  def create
    @classified = Classified.new(classified_params)
    if @classified.save
      flash[:success] = "Succesfully added #{@classified.title}. You should receive an email containing a link to update or remove your classified"
      ClassifiedMailer.new_classified(@classified).deliver
    end
    respond_with @classified, location: :classifieds
  end

  def show
    @classified = Classified.find(params[:id])
  end

  protected

  def classified_params
    params.require(:classified).permit(
      :title, :description, :price, :city, :state,
      :country, :email, :filepicker_url
    )
  end
end
