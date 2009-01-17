class Calculator
  def initialize
    @numbers = []
  end
  
  def push(n)
    @numbers << n
  end
  
  def add
    @numbers.inject { |sum, n| sum + n }
  end

  def subtract
    @numbers.inject { |sum, n| sum - n }
  end

end