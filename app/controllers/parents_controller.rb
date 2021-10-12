class ParentsController < ApplicationController
  def index
    @zoos = ['Zoo 1', 'Zoo 2', 'Zoo 3']
    @hotels = ['Hotel 1', 'Hotel 2', 'Hotel 3']
  end
end