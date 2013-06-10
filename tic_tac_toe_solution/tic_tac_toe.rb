require_relative './board'

class TicTacToe
  
  # These are examples of Ruby Constants
  PLAYERS_1_MARK = "x"
  PLAYERS_2_MARK = "o"

  # When a new game is started, a new board is drawn and player 1 starts
  def initialize
    @board          = Board.new
    @players_1_turn = true
  end

  # Mark the given num on the board with the current player's mark
  # i.e. if @players_1_turn is true, use PLAYERS_1_MARK,
  # otherwise use PLAYERS_2_MARK
  def mark_space(input)
    mark = @players_1_turn ? PLAYERS_1_MARK : PLAYERS_2_MARK
    @board[ (input-1)/3 , (input-1)%3 ] = mark
  end

  # Change players_1_turn to false if it is true or to true if it is false
  def end_turn
    @players_1_turn = !@players_1_turn
  end

  # Check if in any the rows, columns, or diagonals of the board
  # there are 3 of the given mark. If there are, then that means the mark has won.
  # You can get the board's rows, columns, and diagonals with these:
  # @board.rows, @board.columns, and @board.diagonals
  def did_mark_win?(mark)
    (@board.rows + @board.columns + @board.diagonals).any? do |line|
      line == mark * 3
    end
  end


  # Check if a player has won
  def did_player_win?
    if @players_1_turn
      did_mark_win?(PLAYERS_1_MARK)
    else
      did_mark_win?(PLAYERS_2_MARK)
    end
  end

  # Check if the game has been tied 
  def tied?
    @board.flatten.none? {|string| string =~ /\d/ }
  end

  def ask_player_to_play
    if @players_1_turn
      return "\nYour turn Player 1: "
    else
      return "\nYour turn Player 2: "
    end
  end

  def draw_board
    print @board.draw_board
  end

end
