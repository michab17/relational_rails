class ZoosController < ApplicationController
  def index
    @zoos = Zoo.all.sort_by &:created_at
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
      created_at: params[:zoo][:created_at],
      updated_at: params[:zoo][:updated_at]
    })

    zoo.save

    redirect_to '/zoos'
  end
end