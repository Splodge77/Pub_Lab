class Customer

  attr_reader :name, :wallet, :age, :drunkenness

  def initialize(name, wallet, age, drunkenness)
      @name = name
      @wallet = wallet
      @age = age
      @drunkenness = drunkenness
  end


  def can_afford_drink?(drink)
    return @wallet >= drink.price
  end

  def can_afford_food?(food)
    return @wallet >= food.price
  end

  def buy_drink(drink_to_buy)
    @wallet -= drink_to_buy.price
    @drunkenness += drink_to_buy.alcohol_level
  end

  def old_enough?()
    return @age >= 18
  end


end
