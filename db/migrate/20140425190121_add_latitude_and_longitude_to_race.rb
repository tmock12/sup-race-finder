class AddLatitudeAndLongitudeToRace < ActiveRecord::Migration
  def change
    add_column :races, :latitude, :float
    add_column :races, :longitude, :float
  end
end
