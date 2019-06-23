require "test/unit"
require_relative "../multiply"
require_relative "../number"

class TestMultiply < Test::Unit::TestCase
  def test_multiply_string
    expr = Multiply.new(Number.new(2), Number.new(2))
    assert_equal("2 * 2", expr.to_s)
  end
end
