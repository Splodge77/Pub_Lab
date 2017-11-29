class Customer

  attr_reader :name, :wallet, :age

  def initialize(name, wallet, age)
      @name = name
      @wallet = wallet
      @age = age
  end


  def can_afford?(drink)
    return @wallet >= drink.price
  end

  def buy_drink(drink_to_buy)
    @wallet -= drink_to_buy.price
  end

  def old_enough?()
    return @age >= 18
  end
end
