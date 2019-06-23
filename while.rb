class While < Struct.new(:cond, :body)
  def to_s
    "while (#{cond}) { #{body} }"
  end

  def inspect
    "#{self}"
  end

  def reduce(env)
    [If.new(cond, Sequence.new(body, self), DoNothinf), env]
  end
end
