class Add < Struct.new(:left, :right)
  def to_s
    "#{left} + #{right}"
  end

  def inspect
    "#{self}"
  end

  def reducible?
    true
  end

  def reduce(env = {})
    if left.reducible?
      Add.new(left.reduce(env), right)
    elsif right.reducible?
     Add.new(left, right.reduce(env))
    else
      Number.new(left.value + right.value)
    end
  end
end
