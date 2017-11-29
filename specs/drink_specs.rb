require('minitest/autorun')
require('minitest/rg')
require_relative('../drinks.rb')

class TestDrinks < Minitest::Test

  def setup
    @drink1 = Drink.new("Lager", 5, 20)
    @drink2 = Drink.new("Vodka", 10, 50)
    @drink3 = Drink.new("Jager", 1, 100)
  end

end
