# frozen_string_literal: true

class StructureReflex < ApplicationReflex
  def add_contact
    structure = Structure.find(element.dataset[:id])
    contactid = element[:value].start_with?("Select a") ? nil : element[:value]
    mycontact = Contact.find(contactid)
    structure.contacts << mycontact
  end
  def remove_structure
    engagement = Engagement.find(element.dataset[:engagementid])
    structureid = element.dataset[:structureid]
    engagement.structures.delete(structureid)
  end
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
end
