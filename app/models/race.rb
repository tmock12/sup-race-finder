class Race < ActiveRecord::Base
  geocoded_by :full_address
  validate :new_race
  after_validation :geocode

  def full_address
    [street, city, state, zip, country].compact.reject{ |x| x.blank? }.join(', ')
  end

  private

  def new_race
    errors.add(:title, "Race already in database") if
    Race.where(date: date).where("title LIKE ?", "%#{title}%").present?
  end
end
