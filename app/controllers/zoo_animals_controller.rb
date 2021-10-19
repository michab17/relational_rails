class ZooAnimalsController < ApplicationController
  def index
    @zoo = Zoo.find(params[:id])
    if params[:sort]
      @animals = @zoo.animals_sort_by_name
    elsif params[:num]
      @animals = @zoo.animals_threshold(params[:num])
    else
      @animals = @zoo.animals
    end
  end
end