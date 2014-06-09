class Classified < ActiveRecord::Base
  validates :title, :price, :email, presence: true
  before_save :generate_token, on: :create

  def full_address
    [city, state, country].compact.reject(&:blank?).join(', ')
  end

  protected

  def generate_token
    self.token = SecureRandom.hex.upcase
  end
end
