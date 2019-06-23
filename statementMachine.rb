class StatementMachine < Struct.new(:statement, :env)
  def step
    self.statement, self.env = statement.reduce(env)
  end

  def run
    while statement.reducible?
      step
    end

    statement
  end
end
