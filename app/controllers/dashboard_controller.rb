class DashboardController < ApplicationController
  def dashboard
    @engagements = Engagement.all
  end
end
