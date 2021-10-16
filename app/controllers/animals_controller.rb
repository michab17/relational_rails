class AnimalsController < ApplicationController
  def index
    @animals = Animal.only_true
  end

  def show
    @animal = Animal.find(params[:id])
  end

  def new
    @zoo = Zoo.find(params[:id])
  end

  def create
    zoo = Zoo.find(params[:id])
    animal = zoo.animals.create({
      name: params[:name],
      has_covid: params[:has_covid],
      age: params[:age],
      created_at: DateTime.now,
      updated_at: DateTime.now
    })
    
    animal.save

    redirect_to "/zoos/#{zoo.id}/animals"
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    animal = Animal.find(params[:id])
    animal.update({
      name: params[:animal][:name],
      has_covid: params[:animal][:has_covid],
      age: params[:animal][:age],
      updated_at: DateTime.now
    })
    animal.save 

    redirect_to "/animals/#{animal.id}"
  end
end