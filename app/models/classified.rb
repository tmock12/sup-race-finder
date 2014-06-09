class Classified < ActiveRecord::Base
  validates :title, :price, :email, presence: true

  def full_address
    [city, state, country].compact.reject(&:blank?).join(', ')
  end
end
