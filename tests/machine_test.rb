require "test/unit"
require_relative "../machine"

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

  def test_varaible
    expr = Add.new(Variable.new(:x), Variable.new(:y))
    env = { x: Number.new(2), y: Number.new(3) }

    assert_equal("5", Machine.new(expr, env).run.to_s)
  end

  def test_while
    expr = While.new(
      LessThan.new(Variable.new(:x), Number.new(5)),
      Assign.new(:x, Multiply.new(Variable.new(:x), Number.new(3)))
    )
    env = { x: Number.new(1) }

    assert_equal("9", Machine.new(expr, env).run.to_s)
  end
end
