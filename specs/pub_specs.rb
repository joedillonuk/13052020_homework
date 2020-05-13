require('minitest/autorun')
require('minitest/reporters')
require_relative('../pub')
require_relative('../customer')
require_relative('../drink')
require_relative('../food')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
class TestPub < MiniTest::Test
  def setup()
    @customer = Customer.new("Bob", 100, 20)
    @customer2 = Customer.new("Samantha", 20, 15)
    @drink = Drink.new("peroni", 2, 4)
    @drink1 = Drink.new("Merlot", 4, 3)
    @pub = Pub.new("Blue Lagoon")
    @food = Food.new("chips", 2, 2)
  end


def test_stock_count
  assert_equal(0, @pub.stock_count)
end

def test_add_drink_to_stock
  @pub.add_drink_to_stock(@drink, 10)
  assert_equal(10, @pub.stock_count)
end

def test_reduce_stock_count
  @pub.add_drink_to_stock(@drink, 2)
  @pub.add_drink_to_stock(@drink1, 4)

  @pub.reduce_stock_count(@drink1)
  assert_equal(5, @pub.stock_count)
end

def test_till_count
  assert_equal(0, @pub.till_count)
end

def test_increase_till
  @pub.increase_till(@drink)
  assert_equal(2, @pub.till_count)
end

def test_check_age_true
  assert_equal(true, @pub.check_age(@customer))
end

def test_check_age_false
  assert_equal(false, @pub.check_age(@customer2))
end


def test_total_stock_value
  @pub.add_drink_to_stock(@drink, 5)
  @pub.add_drink_to_stock(@drink1, 4)
  assert_equal(26, @pub.total_stock_value)
end






end
