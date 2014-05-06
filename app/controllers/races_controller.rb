class RacesController < ApplicationController
  expose(:start_date) do
    date_parse(params[:start_date]) || Date.today
  end
  expose(:end_date) do
    date_parse(params[:end_date]) || 1.year.from_now.to_date
  end

  def index
    @races = races_hash
    render cms_layout: 'application'
  end

  def create
    redirect_to :back
  end

  protected

  def races_hash
    Gmaps4rails.build_markers(races) do |races, marker|
      marker.lat races[1][0].latitude
      marker.lng races[1][0].longitude
      marker.infowindow render_to_string partial: '/races/race', locals: { races: races }
    end
  end

  def date_parse(date)
    date.values.join('/').try(:to_date) if date
  end

  def races
    Race.where(:date => start_date..end_date.end_of_month).group_by(&:latitude)
  end

end
