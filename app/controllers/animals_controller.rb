class AnimalsController < ApplicationController
  def index
    @animals = ["animal1", "animal2"]
  end
end