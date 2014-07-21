class Race < ActiveRecord::Base
  geocoded_by :full_address
  validate :new_race, on: :create
  validates :email, :date, :title, presence: true
  before_save :generate_token, on: :create

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :same_day, ->(date) { where(date: date) }

  def full_address
    [street, city, state, zip, country].compact.reject(&:blank?).join(', ')
  end

  def activate!
    coords = geocode
    self.latitude = coords.try(:first)
    self.longitude = coords.try(:last)
    self.active = true
    self.save
  end

  private

  def new_race
    errors.add(:title, "already exists") if
    Race.same_day(date).where("UPPER(title) LIKE UPPER(?)", "%#{title}%").present?
  end

  def generate_token
    self.token = SecureRandom.hex.upcase
  end
end
