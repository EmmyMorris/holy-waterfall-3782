require 'rails_helper'

RSpec.describe Airline, type: :model do
  it {should have_many :flights}
  it {should have_many(:passengers).through(:flights)}

  describe "Finds distinct passengers over the age of 18 for an airline" do
     it "It should return adult passangers(over 18 years old)" do
       # User Story 3, Airline's Passengers
       # As a visitor
       # When I visit an airline's show page
       # Then I see a list of passengers that have flights on that airline
       # And I see that this list is unique (no duplicate passengers)
       # And I see that this list only includes adult passengers
       # (Note: an adult is anyone with age greater than or equal to 18)
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
       @pass_flight_3 = PassengerFlight.create!(passenger: @passenger_2, flight: @flight_3)
       @pass_flight_4 = PassengerFlight.create!(passenger: @passenger_3, flight: @flight_3)
       @pass_flight_5 = PassengerFlight.create!(passenger: @passenger_4, flight: @flight_3)
       @pass_flight_6 = PassengerFlight.create!(passenger: @passenger_1, flight: @flight_3)

       expect(@airline_1.adult_passengers).to eq([@passenger_2, @passenger_3])
     end
  end
end
