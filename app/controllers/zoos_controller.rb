class ZoosController < ApplicationController
  def index
    @zoos = Zoo.reverse_order
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
      created_at: DateTime.now,
      updated_at: DateTime.now
    })

    zoo.save

    redirect_to '/zoos'
  end

  def edit
    @zoo = Zoo.find(params[:id])
  end

  def update
    zoo = Zoo.find(params[:id])
    zoo.update({
      name: params[:zoo][:name],
      open: params[:zoo][:open],
      num_of_people: params[:zoo][:num_of_people],
      updated_at: DateTime.now
    })
    zoo.save 

    redirect_to "/zoos/#{zoo.id}"
  end

  def show_children
    @zoo = Zoo.find(params[:id])
    @animals = @zoo.animals
  end

  def sorted_index
    @zoo = Zoo.find(params[:id])
    @animals = Zoo.sort_by_name
  end
end