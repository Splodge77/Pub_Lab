require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drink.rb')
require_relative('../customer.rb')


class TestPub < Minitest::Test

  def setup
  @drink1 = Drink.new("Lager", 5)
  @drink2 = Drink.new("Vodka", 10)
  @drink3 = Drink.new("Jager", 1)
  @chanter_drinks = [@drink1, @drink2, @drink3]
  @chanter_till = 200
  @pub = Pub.new("Chanter", @chanter_till, @chanter_drinks)
  @customer1 = Customer.new("Robert", 100, 32)
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

  def test_till_increases_when_customer_buys_drink
    @pub.sell_drink(@drink2)
    # @chanter_till += @drink2.price
    assert_equal(210, @pub.till)
  end

  def test_transaction
    @pub.transaction(@customer1, @drink2)
    assert_equal(210, @pub.till)
    assert_equal(90, @customer1.wallet)
  end


end
