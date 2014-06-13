class DashboardsController < ApplicationController
  before_filter :require_user

  def show
    @races = Race.inactive.group_by(&:date)
  end
end
