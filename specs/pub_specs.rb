require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drink.rb')
require_relative('../customer.rb')


class TestPub < Minitest::Test

  def setup
  @drink1 = Drink.new("Lager", 5, 20)
  @drink2 = Drink.new("Vodka", 10, 50)
  @drink3 = Drink.new("Jager", 1, 100)
  @chanter_drinks = [@drink1, @drink2, @drink3]
  @chanter_till = 200
  @pub = Pub.new("Chanter", @chanter_till, @chanter_drinks)
  @customer1 = Customer.new("Robert", 100, 32, 0)
  @customer2 = Customer.new("Zsolt", 500, 32, 450)
  @customer3 = Customer.new("John", 500, 32, 600)
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

  def test_too_drunk__false
    assert_equal(false, @pub.too_drunk?(@customer1))
  end

  def test_too_drunk__true
    assert_equal(true, @pub.too_drunk?(@customer3))
  end

  def test_pub_refuses_service__insufficient_funds
    # 11.times{
    #   @pub.transaction(@customer1, @drink2)
    # }
    @pub.transaction(@customer1, @drink2)
    @pub.transaction(@customer1, @drink2)
    @pub.transaction(@customer1, @drink2)
    @pub.transaction(@customer1, @drink2)
    @pub.transaction(@customer1, @drink2)
    @pub.transaction(@customer1, @drink2)
    @pub.transaction(@customer1, @drink2)
    @pub.transaction(@customer1, @drink2)
    @pub.transaction(@customer1, @drink2)
    @pub.transaction(@customer1, @drink2)
    assert_equal(300, @pub.till())
    assert_equal(0, @customer1.wallet())
  end

  def test_pub_refuses_service__too_drunk
    # get a customer to test it with, and make them drink enough alcohol to go over the limit
    @pub.transaction(@customer2, @drink2)
    @pub.transaction(@customer2, @drink2)
    assert_equal(210, @pub.till())
    assert_equal(490, @customer2.wallet())
    assert_equal(500, @customer2.drunkenness())
  end



end
