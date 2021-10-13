class ZoosController < ApplicationController
  def index
    @zoos = Zoo.all
  end

  def new
  end

  def show
    @zoo = Zoo.find(params[:id])
  end

  def create
    zoo = Zoo.new({
      name: params[:zoo][:name],
      open: params[:zoo][:open],
      num_of_people: params[:zoo][:num_of_people],
      opening_day: params[:zoo][:opening_day],
      animal_added: params[:zoo][:animal_added]
    })

    zoo.save

    redirect_to '/zoos'
  end
end