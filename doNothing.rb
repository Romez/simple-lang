class DoNothing
  def to_s
    'do-nothing'
  end

  def inspect
    "#{self}"
  end

  def ==(other_statment)
    other_statment.instance_of?(DoNothing)
  end

  def reducible?
    false
  end
end
