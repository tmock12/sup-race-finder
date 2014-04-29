class RacesController < ApplicationController

  def index
    @races = races_hash
    render cms_layout: 'application'
  end

  protected

  def races_hash
    Gmaps4rails.build_markers(Race.all) do |race, marker|
      marker.lat race.latitude
      marker.lng race.longitude
      marker.infowindow render_to_string partial: '/races/race', locals: { race: race }
    end
  end
end
