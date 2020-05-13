require('minitest/autorun')
require('minitest/reporters')
require_relative('../customer')
require_relative('../drink')
require_relative('../pub')
require_relative('../food')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
class TestCustomer < MiniTest::Test
  def setup()
    @customer = Customer.new("Bob", 100, 20)
    @customer2 = Customer.new("Samantha", 20, 15)
    @drink = Drink.new("peroni", 2, 4)
    @pub = Pub.new("Blue Lagoon")
    @food = Food.new("chips", 2, 2)

  end

def test_drinks_count
  assert_equal(0, @customer.drinks_count)
end


def test_buy_drink
  @customer.buy_drink(@drink)
  assert_equal(1, @customer.drinks_count)
end


def test_reduce_wallet
  @customer.reduce_wallet(@drink)
  assert_equal(98, @customer.wallet)
end

def test_sale
  #@pub.add_drink_to_stock(@drink)
  @pub.add_drink_to_stock(@drink, 2)
  @customer.sale(@drink, @pub, @customer)
  assert_equal(false, @pub.check_age(@customer2))
  assert_equal(true, @pub.check_age(@customer))
  assert_equal(1, @customer.drinks_count)
  assert_equal(false, @customer.over_alcohol_level)
  assert_equal(98, @customer.wallet)
  assert_equal(2, @pub.till_count)
  assert_equal(1, @pub.stock_count)
end

def test_drunkenness_level
  @customer.drunkenness_level_increase(@drink)
  assert_equal(4, @customer.drunkenness)
end

def test_over_alcohol_level
  assert_equal(false, @customer.over_alcohol_level)
end

def test_over_alcohol_level
  @customer.sale(@drink, @pub, @customer)
  @customer.sale(@drink, @pub, @customer)
  @customer.sale(@drink, @pub, @customer)
  assert_equal(true, @customer.over_alcohol_level)
end

def test_sale_to_drunk
  @pub.add_drink_to_stock(@drink, 4)
  @customer.sale(@drink, @pub, @customer)
  @customer.sale(@drink, @pub, @customer)
  @customer.sale(@drink, @pub, @customer)
  @customer.sale(@drink, @pub, @customer)
  assert_equal(true, @pub.check_age(@customer))
  assert_equal(3, @customer.drinks_count)
  assert_equal(true, @customer.over_alcohol_level)
  assert_equal(94, @customer.wallet)
  assert_equal(6, @pub.till_count)
  assert_equal(1, @pub.stock_count)
  assert_equal("No sale", @customer.sale(@drink, @pub, @customer))
end


def test_buy_food
  @customer.sale(@drink, @pub, @customer)
  assert_equal(2, @customer.buy_food(@food))
end

end
