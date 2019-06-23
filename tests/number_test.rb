require "test/unit"
require_relative "../number"

class TestNumber < Test::Unit::TestCase
  def test_inspect
    assert_equal(4.to_s, Number.new(4).to_s)
  end
end
