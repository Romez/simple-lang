require "test/unit"
require_relative "../add"
require_relative "../number"

class TestAdd < Test::Unit::TestCase
  def test_add_to_s
    expr = Add.new(Number.new(2), Number.new(2))
    assert_equal("2 + 2", expr.to_s)
  end

  def test_reduce
    expr = Add.new(Number.new(2), Number.new(2))
    res = expr.reduce
    assert_equal("4", res.to_s)
  end
end
