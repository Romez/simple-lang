class Multiply < Struct.new(:left, :right)
  def to_s
    "#{left} * #{right}"
  end

  def inspect
    "#{self}"
  end

  def reducible?
    true
  end

  def reduce(env = {})
    if left.reducible?
      Multiply.new(left.reduce(env), right)
      elseif right.reducible?
      Multiply.new(left, right.reduce(env))
    else
      Number.new(left.value * right.value)
    end
  end
end
