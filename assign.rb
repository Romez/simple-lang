require "./doNothing"

class Assign < Struct.new(:name, :expr)
  def to_s
    "#{name} = #{expr}"
  end

  def inspect
    "#{self}"
  end

  def reducible?
    true
  end

  def reduce(env)
    if expr.reducible?
      [Assign.new(name, expr.reduce(env)), env]
    else
      [DoNothing.new, env.merge({ name => expr })]
    end
  end
end
