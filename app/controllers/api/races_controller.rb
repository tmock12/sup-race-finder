class Api::RacesController < ApiController

  def create
    race = Race.new(race_params)
    if race.save
      render json: race, status: :created, serializer: Api::RaceSerializer
    else
      render json: {errors: race.errors.full_messages}, status: :bad_request
    end
  end

  protected

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
