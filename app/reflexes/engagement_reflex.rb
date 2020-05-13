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
  def add_contact
    engagement = Engagement.find(element.dataset[:id])
    contactid = element[:value].start_with?("Select a") ? nil : element[:value]
    mycontact = Contact.find(contactid)
    engagement.contacts << mycontact
  end
  def change_partner_name
    partner = session[:partner]
    name = element[:value]
    partner.name = name
  end

  def change_partner_instrument
    partner = session[:partner]
    instrument = element[:value]
    partner.instrument = instrument
  end

  def add_partner
    engagement = Engagement.find(element.dataset[:id])
    partner = session[:partner]
    engagement.partners << partner
    session[:partner] = Partner.new
  end
  def remove_partner
    engagement = Engagement.find(element.dataset[:engagementid])
    partnerid = Partner.find(element.dataset[:partnerid])
    engagement.partners.delete(partnerid)
  end
end
