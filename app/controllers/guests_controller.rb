class GuestsController < ApplicationController
  def index
    @guests = Guest.only_true
  end

  def show
    @guest = Guest.find(params[:id])    
  end

  def new
    @hotel = Hotel.find(params[:id])
  end

  def create
    hotel = Hotel.find(params[:id])
    guest = hotel.guests.create({
      name: params[:name],
      royalty_member: params[:royalty_member],
      room_number: params[:room_number],
      created_at: DateTime.now,
      updated_at: DateTime.now
    })
    
    guest.save

    redirect_to "/hotels/#{hotel.id}/guests"
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def update
    guest = Guest.find(params[:id])
    guest.update({
      name: params[:guest][:name],
      royalty_member: params[:guest][:royalty_member],
      room_number: params[:guest][:room_number],
      updated_at: DateTime.now
    })
    guest.save 

    redirect_to "/guests/#{guest.id}"
  end

  def destroy
    @guest = Guest.destroy(params[:id])

    redirect_to "/guests"
  end
end