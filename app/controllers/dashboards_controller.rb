class DashboardsController < ApplicationController
  before_filter :require_user

  def show
    @races = Race.inactive
  end
end
