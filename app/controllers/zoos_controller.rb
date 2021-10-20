class ZoosController < ApplicationController
  def index
    if params[:sort]
      @zoos = Zoo.num_of_animals
    else
      @zoos = Zoo.reverse_order
    end
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
  
  def destroy
    @zoo = Zoo.find(params[:id])

    @zoo.animals.destroy_all
    @zoo.destroy

    redirect_to "/zoos"
  end
end