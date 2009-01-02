require 'board'
require 'brain'
require 'brain_cell'
require 'core_ext'
require 'grids'
require 'ostruct'
require 'solver'

def solve(start)
  board = Board.new(start)
  fail("Bad board") unless board.size == 9 && board[4].size == 9

  brain = Brain.new
  fail("Bad brain: rows=#{brain.size}, cols=#{brain[7].size}") unless brain.size == 9 && brain[7].size == 9 && brain[3][1].size == 9

  state = OpenStruct.new
  think(board, brain, state)

  return state.finished.to_s
end

def think(board, brain, state)
  board = board.deep_copy
  brain = brain.deep_copy
  grids = Grids.new(board)

  blanks = board.blanks
  if blanks.empty?
    state.finished = board
  end
  
  return if state.finished

  begin
    brain.narrow(blanks, board, grids)
  rescue BrainCell::EmptyException
    return
  end

  solvers = brain.solvers(blanks)
  
  if solvers.empty?    
    brain.guess(board, blanks, state)

  else
    begin
      solvers.check_for_conflicts(grids)
      solvers.solve(board)
    rescue Solver::ConflictException
      return
    end
  end
  
  think(board, brain, state)
end