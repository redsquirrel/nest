class Solvers < Array
  class ConflictException < Exception; end    
  
  def check_for_conflicts(grids)
    each do |s1|
      grid1 = grids.get(s1.x, s1.y)

      each do |s2|
        next if s1.x == s2.x && s1.y == s2.y

        if s1.x == s2.x && s1.value == s2.value
          raise ConflictException
        end
        if s1.y == s2.y && s1.value == s2.value
          raise ConflictException
        end

        grid2 = grids.get(s2.x, s2.y)
        if grid1 == grid2 && s1.value == s2.value
          raise ConflictException
        end
      end
    end
  end
  
  def solve(board)
    each do |s|
      board.set(s.x, s.y, s.value)
    end    
  end
end