require 'rails_helper'

RSpec.describe Airline, type: :model do
  it {should have_many :flights}
  it {should have_many(:passengers).through(:flights)}

  def adult_passengers
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
    expect(Airline.adult_passengers).to eq([@customer_2, @customer_3])
  end
end
