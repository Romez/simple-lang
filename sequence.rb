class Sequence < Struct.new(:first, :second)
  def to_s
    "#{first}; #{second}"
  end

  def inspect
    "#{self}"
  end

  def reducible?
    true
  end

  def reduce(env)
    case first
    when DoNothing.new
      [second, env]
    else
      reduced_first, reduced_env = first.reduce(env)
      [Sequence.new(reduced_first, second), reduced_env]
    end
  end
end
