class Race < ActiveRecord::Base
  geocoded_by :full_address
  after_validation :geocode

  def full_address
    [street, city, state, zip, country].compact.join(', ')
  end
end
