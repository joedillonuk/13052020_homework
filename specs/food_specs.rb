require('minitest/autorun')
require('minitest/reporters')
require_relative('../food')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
class TestFood < MiniTest::Test
  def setup()

  end
end
