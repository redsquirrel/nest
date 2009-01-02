class Board < Array
  def initialize(raw)
    super(raw.map { |l| l.chomp.split(//).map { |s| s.to_i } })
  end
  
  def blanks
    blanks = []
    each_with_index do |row, y|
      row.each_with_index do |cell, x|
        if cell.zero?
          blanks << [x, y]
        end
      end
    end
    blanks
  end

  def set(x, y, value)
    self[y][x] = value
  end
  
  def report
    map { |row| row.map { |c| c.zero? ? " " : c }.join("") }.join("\n")
  end
end
