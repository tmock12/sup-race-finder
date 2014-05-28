class Race < ActiveRecord::Base
  geocoded_by :full_address
  validate :new_race, on: :create

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  def full_address
    [street, city, state, zip, country].compact.reject{ |x| x.blank? }.join(', ')
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
    errors.add(:title, "Race already in database") if
    Race.where(date: date).where("title LIKE ?", "%#{title}%").present?
  end
end
