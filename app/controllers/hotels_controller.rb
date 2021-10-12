class HotelsController < ApplicationController
  def index
    @hotels = ['Hotel 1', 'Hotel 2', 'Hotel 3']
  end

  def new
  end

  def create
    hotel = Hotel.new({
      name: params[:hotel][:name],
      vacancy?: params[:hotel][:vacancy?],
      occupancy: params[:hotel][:occupancy],
      opening_day: params[:hotel][:opening_day],
      newest_check_in: params[:hotel][:newest_check_in]
    })

    hotel.save

    redirect_to '/hotels'
  end
end