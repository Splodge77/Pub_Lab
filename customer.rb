class Customer

  attr_reader :name, :wallet

  def initialize(name, wallet)
      @name = name
      @wallet = wallet
  end


  def can_afford?(drink)
    return @wallet >= drink.price
  end


end
