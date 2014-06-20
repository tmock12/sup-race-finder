class Api::RacesController < ApiController

  def create
    race = Race.new(race_params)
    if race.save
      render json: race, status: :created, serializer: Api::RaceSerializer
    else
      render json: {errors: race.errors.full_messages}, status: :bad_request
    end
  end

  def index
    render json: Race.active.where(:date => Chronic.parse(start_date)..Chronic.parse(end_date)).
      order(:date), each_serializer: Api::RaceSerializer
  end

  protected

  def start_date
    params[:start_date].presence || Date.today
  end

  def end_date
    params[:end_date].presence || (start_date + 1.year)
  end

  def race_params
    params.require(:race).permit(
      :title,
      :city,
      :state,
      :country,
      :url,
      :latitude,
      :longitude,
      :email
    ).merge({ date: Chronic.parse(params[:race][:date]) })
  end
end
