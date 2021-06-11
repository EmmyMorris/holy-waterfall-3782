require 'rails_helper'

RSpec.describe 'airlines show page' do
  before(:each) do
    @airline_1 = Airline.create!(name: "Frontier")
    @flight_1 = @airline_1.flights.create!(number: "1727", date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
    @flight_2 = @airline_1.flights.create!(number: "1384", date: "02/17/20", departure_city: "Miami", arrival_city: "Seattle")
    @flight_3 = @airline_1.flights.create!(number: "7823", date: "11/25/20", departure_city: "Miami", arrival_city: "Seattle")
    @passenger_1 = Passenger.create!(name: "Joe", age: 7)
    @passenger_2 = Passenger.create!(name: "Bobby", age: 65)
    @passenger_3 = Passenger.create!(name: "Mark", age: 28)
    @passenger_4 = Passenger.create!(name: "Sarah", age: 14)

    @pass_flight_1 = PassengerFlight.create!(passenger: @passenger_1, flight: @flight_1)
    @pass_flight_2 = PassengerFlight.create!(passenger: @passenger_2, flight: @flight_2)
    @pass_flight_3 = PassengerFlight.create!(passenger: @passenger_3, flight: @flight_3)
    @pass_flight_4 = PassengerFlight.create!(passenger: @passenger_4, flight: @flight_3)
    @pass_flight_5 = PassengerFlight.create!(passenger: @passenger_4, flight: @flight_1)
  end
  it "shows a list of passengers that have flights on that airline" do
    # User Story 3, Airline's Passengers
    # As a visitor
    # When I visit an airline's show page
    # Then I see a list of passengers that have flights on that airline
    # And I see that this list is unique (no duplicate passengers)
    # And I see that this list only includes adult passengers
    # (Note: an adult is anyone with age greater than or equal to 18)
    visit "/airlines/#{@airline_1.id}"
    expect(current_path).to eq("/airlines/#{@airline_1.id}")
    expect(page).to have_content(@airline_1.name, count: 1)

    expect(page).to have_content(@passenger_2.name, count: 1)
    expect(page).to have_content(@passenger_3.name, count: 1)

    expect(page).to_not have_content(@passenger_1.name, count: 1)
    expect(page).to_not have_content(@passenger_4.name, count: 1)
  end
end
