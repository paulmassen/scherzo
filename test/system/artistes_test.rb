require "application_system_test_case"

class ArtistesTest < ApplicationSystemTestCase
  setup do
    @artiste = artistes(:one)
  end

  test "visiting the index" do
    visit artistes_url
    assert_selector "h1", text: "Artistes"
  end

  test "creating a Artiste" do
    visit artistes_url
    click_on "New Artiste"

    fill_in "Address", with: @artiste.address
    fill_in "Birthdate", with: @artiste.birthdate
    fill_in "Name", with: @artiste.name
    fill_in "Passportdelivered", with: @artiste.passportdelivered
    fill_in "Passportexpire", with: @artiste.passportexpire
    fill_in "Passportnumber", with: @artiste.passportnumber
    click_on "Create Artiste"

    assert_text "Artiste was successfully created"
    click_on "Back"
  end

  test "updating a Artiste" do
    visit artistes_url
    click_on "Edit", match: :first

    fill_in "Address", with: @artiste.address
    fill_in "Birthdate", with: @artiste.birthdate
    fill_in "Name", with: @artiste.name
    fill_in "Passportdelivered", with: @artiste.passportdelivered
    fill_in "Passportexpire", with: @artiste.passportexpire
    fill_in "Passportnumber", with: @artiste.passportnumber
    click_on "Update Artiste"

    assert_text "Artiste was successfully updated"
    click_on "Back"
  end

  test "destroying a Artiste" do
    visit artistes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Artiste was successfully destroyed"
  end
end
