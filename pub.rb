class Pub

  attr_reader :name, :till, :drinks

  def initialize(input_name, input_till, input_drinks)
      @name = input_name
      @till = input_till
      @drinks = input_drinks
  end


  def sell_drink(drink_to_sell)
    @till += drink_to_sell.price
  end

  def transaction(customer, drink)
    return if !(customer.can_afford?(drink))
    return if too_drunk?(customer)
    sell_drink(drink)
    customer.buy_drink(drink)
  end

  def too_drunk?(customer)
    return customer.drunkenness() >= 500
  end

end
