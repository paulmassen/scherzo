# frozen_string_literal: true

class EngagementReflex < ApplicationReflex
  # Add Reflex methods in this file.
  #
  # All Reflex instances expose the following properties:
  #
  #   - connection - the ActionCable connection
  #   - channel - the ActionCable channel
  #   - request - an ActionDispatch::Request proxy for the socket connection
  #   - session - the ActionDispatch::Session store for the current visitor
  #   - url - the URL of the page that triggered the reflex
  #   - element - a Hash like object that represents the HTML element that triggered the reflex
  #
  # Example:
  #
  #   def example(argument=true)
  #     # Your logic here...
  #     # Any declared instance variables will be made available to the Rails controller and view.
  #   end
  #
  # Learn more at: https://docs.stimulusreflex.com
  def toggle_contract
    engagement = Engagement.find(element.dataset[:id])
    engagement.toggle!(:contract)
  end
  def toggle_voyages
    engagement = Engagement.find(element.dataset[:id])
    engagement.toggle!(:voyages)
  end
  def toggle_hotel
    engagement = Engagement.find(element.dataset[:id])
    engagement.toggle!(:hotel)
  end
  def toggle_taxi
    engagement = Engagement.find(element.dataset[:id])
    engagement.toggle!(:taxi)
  end
  def toggle_sent
    engagement = Engagement.find(element.dataset[:id])
    engagement.toggle!(:sent)
  end
  def toggle_rehearsals
    engagement = Engagement.find(element.dataset[:id])
    engagement.toggle!(:rehearsals)
  end
  def update_structure
    engagement = Engagement.find(element.dataset[:id])
    structureid = element[:value].start_with?("Select a") ? nil : element[:value]
    mystructure = Structure.find(structureid)
    engagement.structures << mystructure
  end
  def remove_structure
    engagement = Engagement.find(element.dataset[:engagementid])
    structureid = element.dataset[:structureid]
    engagement.structures.delete(structureid)
  end
end
