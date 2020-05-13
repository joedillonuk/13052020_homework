class Customer
attr_accessor :name, :wallet, :drinks, :age, :drunkenness

def initialize(name, wallet, age)
  @name = name
  @wallet = wallet
  @drinks = []
  @age = age
  @drunkenness = 0
end

def drinks_count
  @drinks.count
end

def buy_drink(drink)
 @drinks.push(drink)
end

def reduce_wallet(drink)
  @wallet -= drink.price
end

def sale(drink, pub, customer)
  if pub.check_age(customer) == true && customer.over_alcohol_level() == false
    buy_drink(drink)
    reduce_wallet(drink)
    drunkenness_level_increase(drink)
    pub.increase_till(drink)
    pub.reduce_stock_count(drink)
  else
    return "No sale"
  end
end

def drunkenness_level_increase(drink)
  @drunkenness += drink.alcohol_level
end


def over_alcohol_level
  if @drunkenness > 10
    return true
  else
    return false
  end
end

def buy_food(food)
  @drunkenness -=food.rejuvenation_level
end


end
