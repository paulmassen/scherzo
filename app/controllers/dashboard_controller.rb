class DashboardController < ApplicationController
  def dashboard
    @engagements = Engagement.all
    @events = Event.all
    @eventsoftheday = @events.where("eventdate == ?", Date.today)
  end
end
