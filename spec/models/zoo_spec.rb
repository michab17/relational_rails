require 'rails_helper'

RSpec.describe Zoo do 
  it {should have_many :animals}
end 