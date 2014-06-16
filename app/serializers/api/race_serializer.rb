class Api::RaceSerializer < ActiveModel::Serializer
  attributes :title, :date, :city, :state, :country, :url, :email

  private

  def date
    object.date.strftime("%b %d, %Y")
  end
end
