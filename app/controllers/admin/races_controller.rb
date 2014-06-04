class Admin::RacesController < ApplicationController
  before_filter :require_user
  respond_to :html

  def edit
    @race = Race.find(params[:id])
  end

  def update
    @race = Race.find(params[:id])
    @race.update_attributes(race_params)
    respond_with @race, location: :dashboard
  end

  def activate
    race = Race.find(params[:race_id])
    race.activate!
    RaceMailer.activated(race).deliver
    flash[:success] = "Succesfully activated race #{race.title}"
    redirect_to :dashboard
  end

  def destroy
    race = Race.find(params[:id])
    flash[:success] = "Succesfully removed race #{race.title}"
    race.destroy
    redirect_to :list_races
  end

  protected

  def race_params
    params.require(:race).permit(
      :title, :date, :street, :city, :state,
      :country, :zip, :url, :description, :email
    )
  end
end
