require 'rails_helper'

RSpec.describe 'flights index page' do
  # User Story 1, Flights Index Page
  # As a visitor
  # When I visit the flights index page
  # I see a list of all flight numbers
  # And next to each flight number I see the name of the Airline of that flight
  # And under each flight number I see the names of all that flight's passengers
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
  end

  it "Shows a list of all flight numbers" do
    visit "/flights"
    expect(current_path).to eq("/flights")
    expect(page).to have_content(@flight_1.number)
    expect(page).to have_content(@airline_1.name)
    expect(page).to have_content(@passenger_1.name)


    expect(page).to have_content(@flight_2.number)
    expect(page).to have_content(@airline_1.name)
    expect(page).to have_content(@passenger_2.name)


    expect(page).to have_content(@flight_3.number)
    expect(page).to have_content(@airline_1.name)
    expect(page).to have_content(@passenger_3.name)
    expect(page).to have_content(@passenger_4.name)
  end
end
