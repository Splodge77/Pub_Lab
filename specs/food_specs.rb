require('minitest/autorun')
require('minitest/rg')
require_relative('../food.rb')

class TestFood < Minitest::Test

  def setup
    @food1 = Food.new("Scotch Pie", 100, 5)
    @food2 = Food.new("Fish Supper", 300, 10)
    @food3 = Food.new("Alka-Seltzer", 500, 1)
  end

end
