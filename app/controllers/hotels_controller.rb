class HotelsController < ApplicationController
  def index
    @hotels = Hotel.reverse_order
  end

  def new
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  def create
    hotel = Hotel.new({
      name: params[:hotel][:name],
      vacancy: params[:hotel][:vacancy],
      occupancy: params[:hotel][:occupancy],
      created_at: DateTime.now,
      updated_at: DateTime.now
    })

    hotel.save

    redirect_to '/hotels'
  end

  def edit
    @hotel = Hotel.find(params[:id])
  end

  def update
    hotel = Hotel.find(params[:id])
    hotel.update({
      name: params[:hotel][:name],
      vacancy: params[:hotel][:vacancy],
      occupancy: params[:hotel][:occupancy],
      updated_at: DateTime.now
    })
    hotel.save 

    redirect_to "/hotels/#{hotel.id}"
  end

  def destroy
    @hotel = Hotel.find(params[:id])

    @hotel.guests.destroy_all
    @hotel.destroy

    redirect_to "/hotels"
  end
end