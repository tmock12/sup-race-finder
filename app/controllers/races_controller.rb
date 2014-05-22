class RacesController < ApplicationController

  after_filter :set_session_dates

  expose(:start_date) do
    date_parse(params[:start_date]) || session[:start_date].try(:to_date) || Date.today.to_date
  end
  expose(:end_date) do
    date_parse(params[:end_date]) || session[:end_date].try(:to_date) || 1.year.from_now.to_date
  end

  def index
    @races = races_hash
    render cms_layout: 'application'
  end

  def list
    @races = races.order(:date)
  end

  def create
    redirect_to :back
  end

  protected

  def races_hash
    Gmaps4rails.build_markers(races.group_by(&:latitude)) do |races, marker|
      marker.lat races[1][0].latitude
      marker.lng races[1][0].longitude
      marker.infowindow render_to_string partial: '/races/race', locals: { races: races }
    end
  end

  def date_parse(date)
    date.values.join('/').try(:to_date) if date
  end

  def races
    Race.where(:date => start_date..end_date.end_of_month)
  end

  def set_session_dates
    session[:start_date] = start_date.strftime('%Y-%m-%d')
    session[:end_date] = end_date.strftime('%Y-%m-%d')
  end
end
