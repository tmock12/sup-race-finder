class Api::RacesController < ActionController::Base

  def create
    race = Race.new(race_params)
    if race.save
      render nothing: true
    else
      render json: {errors: race.errors.full_messages}, status: :bad_request
    end
  end

  protected

  def race_params
    params.permit(
      :title,
      :date,
      :city,
      :state,
      :country,
      :url,
      :latitude,
      :longitude
    ).merge({email: 'taylor@hashrocket.com'})
  end
end
