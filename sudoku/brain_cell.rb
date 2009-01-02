# Would be nice to have coords in the BrainCell
class BrainCell < Array
  class EmptyException < Exception; end
  
  def narrow(x, y, board, grids)
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
end
