class Brain < Array
  def initialize
    9.times { |i| self[i] = (1..9).map { BrainCell.new([*1..9]) } }    
  end
  
  def narrow(blanks, board, grids)
    blanks.each do |x, y|
      brain_cell = self[y][x]
      brain_cell.narrow(x, y, board, grids)
    end
  end
  
  def solvers(blanks)
    solvers = Solvers.new
    blanks.each do |x, y|
      brain_cell = self[y][x]
      if brain_cell.solved?
        solvers << OpenStruct.new(:x => x, :y => y, :value => brain_cell.solved_value)
      end
    end
    solvers
  end
  
  def guess(board, blanks, state)
    threads = []
    brain_cells = sorted_cells_with_coords_from(blanks)
    brain_cells.each do |brain_cell, coords|
      brain_cell.size.times do |i|
        board[coords.last][coords.first] = brain_cell[i]
        if state.finished
          return
        else
          threads << Thread.new do
            think(board, self, state)
          end
        end
      end
      board[coords.last][coords.first] = 0    
    end
    
  end
  
private
  
  def sorted_cells_with_coords_from(blanks)
    blanks.map { |x, y|
      [self[y][x], [x, y]] 
    }.sort_by { |brain_cell, coords|
      brain_cell.size
    }
  end
end