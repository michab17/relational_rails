class GuestsController < ApplicationController
  def index
    @guests = ["guest1", "guest2"]
  end
end