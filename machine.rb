require "./number"
require "./add"
require "./multiply"

class Machine < Struct.new(:expr)
  def step
    self.expr = expr.reduce
  end

  def run
    while expr.reducible?
      step
    end

    self.expr
  end
end
