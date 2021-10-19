class HotelGuestsController < ApplicationController
  def index
    @hotel = Hotel.find(params[:id])
    if params[:sort]
      @guests = @hotel.guests_sort_by_name
    elsif params[:num]
      @guests = @hotel.guests_threshold(params[:num])
    else
      @guests = @hotel.guests
    end
  end
end