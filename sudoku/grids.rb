class Grids
  SETUP = [[0..2, 0..2, []],[3..5, 0..2, []], [6..8, 0..2, []], [0..2, 3..5, []],[3..5, 3..5, []], [6..8, 3..5, []], [0..2, 6..8, []],[3..5, 6..8, []], [6..8, 6..8, []]]

  def initialize(board)
    @grids = SETUP.deep_copy
    # Figure out which numbers are in which grids
    board.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        @grids.each do |grid|
          if !cell.zero? && grid[0].include?(x) && grid[1].include?(y)
            grid.last << cell
          end
        end
      end
    end
  end
  
  def get(x, y)
    @grids.detect { |g| g[0].include?(x) && g[1].include?(y) }    
  end
end
