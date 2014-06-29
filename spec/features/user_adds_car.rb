require 'rails_helper'

feature 'user adds a car',%q(
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot

  Acceptance Criteria:

  I must specify the manufacturer, color, year, and mileage of the car.
  Only years from 1920 and above can be specified.
  I can optionally specify a description of the car.
  If I enter all of the required information in the required formats, the car is recorded and I am presented with a notification of success
  If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
  Upon successfully creating a car, I am redirected back to the index of cars.

) do
  let(:manufacturer) { FactoryGirl.create(:manufacturer) }

  scenario 'create a valid car' do

    visit new_car_path

    select(manufacturer.name, :from => 'Manufacturer')
    fill_in "Color", with: "Lightning Red"
    fill_in "Year", with: "1986"
    fill_in "Mileage", with: "19213"

    click_on "Create Car"

    expect(page). to have_content("success")
    expect(page). to have_content("Lightning")
    expect(page). to have_content("1986")
    expect(page). to have_content("19213")

  end

  scenario 'user did not fill in required fields' do

    visit new_car_path

    click_on "Create Car"

    expect(page). to have_content("can't be blank")

  end

  scenario 'user enters a very old car' do

    FactoryGirl.create(:manufacturer)

    visit new_car_path

    select(manufacturer.name, :from => 'Manufacturer')
    fill_in "Color", with: "Lightning Red"
    fill_in "Year", with: "1886"
    fill_in "Mileage", with: "19213"

    click_on "Create Car"

    expect(page). to have_content("error")

  end

  scenario 'user enters invalid mileage' do

    FactoryGirl.create(:manufacturer)

    visit new_car_path

    select(manufacturer.name, :from => 'Manufacturer')
    fill_in "Color", with: "Lightning Red"
    fill_in "Year", with: "1886"
    fill_in "Mileage", with: "-19213"

    click_on "Create Car"

    expect(page). to have_content("error")

  end

end
