require "./number"
require "./add"
require "./multiply"
require "./variable"
require "./boolean"
require "./lessThan"
require "./while"
require "./assign"
require "./if"
require "./sequence"
require "./statementMachine"
require "./exprMachine"

class Machine
  def self.new(syntax, *args)
    machine_class =
      case syntax
      when Add, Boolean, LessThan, Multiply, Number, Variable
        ExprMachine
      when Assign, DoNothing, If, Sequence, While
        StatementMachine
      else
        raise "Unrecognized syntax: #{syntax.inspect}"
      end
    machine_class.new(syntax, *args)
  end
end
