class CalendarController < ApplicationController
  def calendar
    @engagements = Engagement.all
    @artistes = Artiste.all
  end
end
