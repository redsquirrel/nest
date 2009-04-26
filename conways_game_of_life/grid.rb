class Grid
  
  def initialize(grid)
    @width = grid.first.size
    @height = grid.size
    @grid = grid
  end
  
  def data
    @grid
  end
  
  NEIGHBORS = [-1, 0, 1]
  
  def next
    new_grid = []
    
    @grid.each_with_index do |row, y|      
      row.each_with_index do |cell, x|

        new_grid[y] ||= []
        new_grid[y][x] = cell
        
        if live_neighbor_count(x, y) < 2
          new_grid[y][x] = 0
        end

        if live_neighbor_count(x, y) > 3
          new_grid[y][x] = 0
        end

        if live_neighbor_count(x, y) == 3 && cell == 0
          new_grid[y][x] = 1
        end
        
      end
    end
    
    Grid.new(new_grid)
  end
  
  def live_neighbor_count(x, y)
    live_neighbor_count = 0
    
    NEIGHBORS.each do |move_x|
      NEIGHBORS.each do |move_y|

        next if move_x == 0 && move_y == 0

        neighbor_y = y + move_y
        neighbor_x = x + move_x

        next if neighbor_x < 0 || neighbor_x >= @width
        next if neighbor_y < 0 || neighbor_y >= @height

        neighbor = @grid[neighbor_y][neighbor_x]
        if neighbor == 1
          live_neighbor_count += 1
        end
      end          
    end
    
    live_neighbor_count
  end
  
  def empty?
    true
  end
  
  def to_s
    @grid.map { |row| row.map {|cell| cell == 0 ? " " : cell }.join }.join("\n")
  end
end