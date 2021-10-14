class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all.sort_by &:created_at
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
      created_at: params[:hotel][:created_at],
      updated_at: params[:hotel][:updated_at]
    })

    hotel.save

    redirect_to '/hotels'
  end
end