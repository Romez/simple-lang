require "test/unit"
require_relative "../multiply"
require_relative "../number"

class TestMultiply < Test::Unit::TestCase
  def test_multiply_to_s
    expr = Multiply.new(Number.new(2), Number.new(2))
    assert_equal("2 * 2", expr.to_s)
  end

  def test_reduce
    expr = Multiply.new(Number.new(2), Number.new(2))
    res = expr.reduce
    assert_equal("4", res.to_s)
  end
end
