class PassengerFlightsController < ApplicationController
  def destroy
    PassengerFlight.find(params[:id]).destroy
    redirect_to "/flights"
  end
end
