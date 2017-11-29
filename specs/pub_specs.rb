require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drink.rb')


class TestPub < Minitest::Test

  def setup
  @drink1 = Drink.new("Lager", 5)
  @drink2 = Drink.new("Vodka", 10)
  @drink3 = Drink.new("Jager", 1)
  @chanter_drinks = [@drink1, @drink2, @drink3]
  @chanter_till = 200
  @pub = Pub.new("Chanter", @chanter_till, @chanter_drinks)
  end


  def test_pub_has_name
    assert_equal("Chanter", @pub.name)
  end

  def test_pub_has_till
    assert_equal(200, @pub.till)
  end

  def test_pub_has_drinks
    assert_equal(3, @pub.drinks.count)
  end


end
