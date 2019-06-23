require "./number"
require "./add"
require "./multiply"
require "./variable"

class Machine < Struct.new(:expr, :env)
  def step
    self.expr = expr.reduce(env)
  end

  def run
    while expr.reducible?
      step
    end

    self.expr
  end
end
