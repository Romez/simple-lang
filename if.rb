class If < Struct.new(:condition, :consequence, :alternative)
  def to_s
    "if #{condition} { #{consequence} else #{alternative}}"
  end

  def inspect
    "#{self}"
  end

  def reducible?
    true
  end

  def reduce(env)
    if condition.reducible?
      [
        If.new(condition.reduce(env), consequence, alternative),
        env
      ]
    else
      case condition
      when Boolean.new(true)
        [consequence, env]
      when Boolean.new(false)
        [alternative, env]
      end
    end
  end
end
