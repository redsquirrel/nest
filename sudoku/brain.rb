# The Brain is basically a collection of BrainCells
class Brain < Array
  def initialize(board)
    board.each_with_index do |row, y|
      self[y] = []
      board.each_with_index do |cell, x|
        self[y][x] = BrainCell.new([*1..9], [x, y])
      end
    end
  end
  
  def narrow(blanks, board, grids)
    blanks.each do |x, y|
      brain_cell = self[y][x]
      brain_cell.narrow(board, grids)
    end
  end
  
  # Solvers are a collection of BrainCells that have only one possibility
  def solvers(blanks)
    solvers = Solvers.new
    blanks.each do |x, y|
      brain_cell = self[y][x]
      if brain_cell.solved?
        solvers << brain_cell
      end
    end
    solvers
  end
  
  # Sometimes in Sudoku, you have to guess in order to move forward
  def guess(board, blanks, state)
    # I sort these as an optimization, it makes more sense to guess
    # with the BrainCells with less possibilities first.
    sorted_cells_from(blanks).each do |brain_cell|
      brain_cell.each do |possibility|
        if state.finished
          return
        else
          # I made this concurrent as an optimization for evil puzzles.
          Thread.new do
            # Here is where I "guess", by setting the spot on the board.
            board.set(brain_cell.x, brain_cell.y, possibility)
            think(board, self, state)
          end
        end
      end
    end
    
  end
  
private
  
  def sorted_cells_from(blanks)
    blanks.map { |x, y|
      self[y][x]
    }.sort_by { |brain_cell|
      brain_cell.size
    }
  end
end