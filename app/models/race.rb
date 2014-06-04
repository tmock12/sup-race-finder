class Race < ActiveRecord::Base
  geocoded_by :full_address
  validate :new_race, on: :create
  validates :email, presence: true
  before_save :generate_token, on: :create

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  def full_address
    [street, city, state, zip, country].compact.reject(&:blank?).join(', ')
  end

  def activate!
    coords = geocode
    self.latitude = coords.first
    self.longitude = coords.last
    self.active = true
    self.save
  end

  private

  def new_race
    errors.add(:title, "already exists") if
    Race.where(date: date).where("UPPER(title) LIKE UPPER(?)", "%#{title}%").present?
  end

  def generate_token
    self.token = SecureRandom.hex.upcase
  end
end
