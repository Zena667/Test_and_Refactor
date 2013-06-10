class Board
attr_accessor :board
  # This is an example of a Ruby Constant
  GAP = "  "

  # When a new game is started, board is set by default to a two-dimensional array with 9 available elements
	def initialize
		@board = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
	end

  # Return the rows of the board (i.e. ["123", "456", "789"])
	def rows
    rows = []
    @board.each do |row|
      rows << row.join # => "123"
    end
    return rows
	end

  # Return the columns of the board (i.e. [["147", "258", "369"]])
	def columns
    columns = []
    for i in 0..2
      column = ""
      @board.each do |row|
        column += row[i]
      end
      columns << column
    end
    return columns
    # 0.upto(2).map do |column|
    #   @board.map { |row| row[column] }.join
    # end
	end

  # Return the diagonals of the board [["159", "357"]]
	def diagonals
		[[0,1,2], [2,1,0]].map do |columns|
			columns.each_with_index.map {|column, row| @board[row][column] }.join
		end
	end

  # Set a mark at a spot on the board by setting a value in the two dimensional board array
	def []=(row, column, mark)
		@board[row][column] = mark
	end

	####### DRAWING #######

  # Draws each row of the tic-tac-toe of the board
  def draw_row(row)
    GAP + row.join(' | ') + "\n"
  end

  # Draws the horizontal structure of the board between rows
  def draw_line
    "#{GAP}---------\n"
  end

  # Draws the entire board with the above methods
  def draw_board
    "\n" + @board.map { |row| draw_row(row) }.join(draw_line)
  end

  def flatten
    @board.flatten
  end

end
