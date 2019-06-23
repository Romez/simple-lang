require "test/unit"
require_relative "../machine"
require_relative "../multiply"
require_relative "../number"

class TestMachine < Test::Unit::TestCase
  def test_simple
    expr = Multiply.new(Number.new(4), Number.new(4))
    assert_equal("16", Machine.new(expr).run.to_s)
  end

  def test_run
    expr = Add.new(
      Number.new(4),
      Multiply.new(Number.new(2), Number.new(5))
    )

    puts Machine.new(expr).run

    assert_equal("14", Machine.new(expr).run.to_s)
  end
end
