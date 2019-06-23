class LessThan < Struct.new(:left, :right)
  def to_s
    "#{left} < #{right}"
  end

  def inspect
    "#{self}"
  end

  def reducible?
    true
  end

  def reduce(env)
    if left.reducible?
      LessThan.new(left.reduce(env), right)
    elsif right.reducible?
      LessThan.new(left, right.reduce(env))
    else
      Boolean.new(left.value < right.value)
    end
  end
end
