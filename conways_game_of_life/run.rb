require 'grid'

grid = Grid.new(
  [[0, 1, 0, 0, 1, 0, 0, 1],
   [1, 0, 1, 0, 0, 1, 0, 1],
   [0, 0, 0, 1, 0, 0, 0, 1],
   [0, 0, 0, 1, 0, 0, 0, 1],
   [0, 0, 0, 1, 0, 0, 0, 1],
   [0, 0, 0, 0, 0, 0, 0, 1],
   [0, 0, 0, 1, 0, 0, 0, 1],
   [0, 0, 0, 1, 0, 0, 0, 1],]
)

puts grid.to_s

gen = 0

loop do
  gen += 1
  puts "----#{gen}"
  sleep 0.2
  grid = grid.next
  puts grid
end
