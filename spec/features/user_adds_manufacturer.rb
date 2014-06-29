require 'rails_helper'

feature 'user adds a car manufacturer',%q(
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot

  Acceptance Criteria:

  I must specify a manufacturer name and country.
  If I do not specify the required information, I am presented with errors.
  If I specify the required information, the manufacturer is recorded and I am redirected to the index of manufacturers
) do

  scenario 'create a valid car manufacturer' do

    visit new_manufacturer_path

    fill_in "Name", with: "Toyota"
    fill_in "Country" with: "Japan"

    click_on "Create Manufacturer"

    expect(page). to have_content("success")
    expect(page). to have_content("Toyota")
    expect(page). to have_content("Japan")

  end

  scenario 'user did not fill in required fields' do
    visit new_manufacturer_path

    fill_in "Name", with: "Toyota"

    click_on "Create Manufacturer"

    expect(page). to have_content("can't be blank")

  end

  scenario 'user enters an existing manufacturer name' do

    FactoryGirl.create(:manufacturer)

    visit new_manufacturer_path

    fill_in "Name", with: "Toyota"

    click_on "Create Manufacturer"

    expect(page). to have_content("can't be blank")

  end

end
