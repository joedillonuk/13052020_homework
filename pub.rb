class Pub
  attr_reader :name
  attr_accessor :till, :drinks

def initialize(name)
  @name = name
  @till = 0
  @drinks = []


end


def stock_count
  total = 0
  for drink in @drinks
    total += drink[:amount]

  end
  return total
end


def add_drink_to_stock(drink, amount)
  @drinks.push({
    drink: drink,
    amount: amount
    })
end

def reduce_stock_count(drink)
  for item in @drinks
    if drink == item[:drink]
      item[:amount] -=1
    end
  end
end


def till_count
  @till
end

def increase_till(drink)
  @till += drink.price
end

def check_age(customer)
  if customer.age >= 18
    return true
  else
    return false
  end
end

# ([name, price, alcohol], 1)

def total_stock_value
  total = 0
  for item in @drinks
    total += item[:amount] * item[:drink].price
  end
  return total
end



end
