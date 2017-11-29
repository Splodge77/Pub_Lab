require('minitest/autorun')
require('minitest/rg')
require_relative('../customer.rb')
require_relative('../drink.rb')


class TestCustomer < Minitest::Test

  def setup
    @customer1 = Customer.new("Robert", 100, 32)
    @customer2 = Customer.new("Max", 0, 29)
    @drink1 = Drink.new("Lager", 5)
    @drink2 = Drink.new("Vodka", 10)
    @drink3 = Drink.new("Jager", 1)
  end

  def test_customer_can_buy_drink
    assert_equal(true, @customer1.can_afford?(@drink2))
  end

  def test_customer_cant_buy_drink
    assert_equal(false, @customer2.can_afford?(@drink2))
  end

  def test_customers_wallet_decreases_with_drink_purchase
    @customer1.buy_drink(@drink2)
    assert_equal(90, @customer1.wallet)
  end
end
