require 'test/unit'
require 'grid'

class GameTest < Test::Unit::TestCase
  
  EMPTY = 
    [[0, 0, 0],
     [0, 0, 0],
     [0, 0, 0]]  
  
  def test_empty_grid
    initial = Grid.new(EMPTY)
    gen1 = initial.next    
    assert_equal(EMPTY, gen1.data)
  end

  def test_grid_with_one_cell
    initial = Grid.new(
      [[0, 0, 0],
       [0, 1, 0],
       [0, 0, 0]]
    )
    gen1 = initial.next
    assert_equal(EMPTY, gen1.data)
  end

  def test_live_neighbor_count_for_center
    initial = Grid.new(
      [[0, 1, 0],
       [0, 1, 0],
       [0, 1, 0]]
    )
    assert_equal 2, initial.live_neighbor_count(1, 1)    
  end

  def test_live_neighbor_count_for_top_right_corner
    initial = Grid.new(
      [[0, 1, 0],
       [0, 1, 0],
       [0, 1, 0]]
    )
    assert_equal 2, initial.live_neighbor_count(2, 0)    
  end

  def test_live_neighbor_count_for_bottom_left
    initial = Grid.new(
      [[0, 1, 0],
       [0, 1, 0],
       [0, 1, 0]]
    )
    assert_equal 2, initial.live_neighbor_count(0, 2)    
  end

  def test_grid_with_surviving_cell
    initial = Grid.new(
      [[0, 1, 0],
       [0, 1, 0],
       [0, 1, 0]]
    )    
    gen1 = initial.next    
    assert_equal(
     [[0, 0, 0],
      [1, 1, 1],
      [0, 0, 0]], gen1.data)
  end

  def test_grid_with_dying_cell
    initial = Grid.new(
      [[0, 1, 0],
       [1, 1, 1],
       [0, 1, 0]]
    )    
    gen1 = initial.next    
    assert_equal(
     [[1, 1, 1],
      [1, 0, 1],
      [1, 1, 1]], gen1.data)
  end
  
  def test_grid_with_spawning_cell
    initial = Grid.new(
      [[0, 1, 0],
       [1, 1, 0],
       [0, 0, 0]]
    )    
    gen1 = initial.next    
    assert_equal(
     [[1, 1, 0],
      [1, 1, 0],
      [0, 0, 0]], gen1.data)
  end  
end