# A brain cell holds the current possibilities for a specific spot on the board
class BrainCell < Array
  class EmptyException < Exception; end
  
  def initialize(possibilities, coords)
    super(possibilities)
    @coords = coords
  end
  
  # This is where we narrow down the possibilities
  def narrow(board, grids)
    row = board[y]
    col = board.map { |r| r[x] }
    reject! { |n| row.include?(n) || col.include?(n) }

    grid = grids.get(x, y)
    reject! { |n| grid.last.include?(n) }
    
    raise EmptyException if empty?   
  end
  
  def solved?
    size == 1    
  end
  
  def solved_value
    raise "Not solved: #{self.join(", ")}" unless solved?
    first
  end
  
  def x
    @coords.first
  end
  
  def y
    @coords.last
  end
  
  def ==(other)
    self.x == other.x && self.y == other.y
  end
end
