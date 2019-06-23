class ExprMachine < Struct.new(:expr, :env)
  def step
    self.expr = expr.reduce(env)
  end

  def run
    while expr.reducible?
      step
    end

    expr
  end
end
