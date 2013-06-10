require "test/unit"
require_relative "tic_tac_toe"

class TicTacToeTest < Test::Unit::TestCase

	def setup
		@instance = TicTacToe.new
	end

	def test_mark_space
		@instance.mark_space(1)
		assert_equal("\n  x | 2 | 3\n  ---------\n  4 | 5 | 6\n  ---------\n  7 | 8 | 9\n", @instance.draw_board)
	end

	def test_end_turn
		@instance.end_turn
		assert_equal("\nYour turn Player 2: ", @instance.ask_player_to_play)
	end

	def test_ask_player_to_play_opposite_return
		assert_equal("\nYour turn Player 1: ", @instance.ask_player_to_play)	
	end

	def test_did_mark_win_true
		@instance.mark_space(1)
		@instance.mark_space(2)
		@instance.mark_space(3)
		assert_equal(true, @instance.did_mark_win?("x"))
	end

	def test_draw_board
  		assert_equal("\n  1 | 2 | 3\n  ---------\n  4 | 5 | 6\n  ---------\n  7 | 8 | 9\n", @instance.draw_board)
  	end

  	def test_did_player_win
  		@instance.end_turn
  		@instance.mark_space(1)
		@instance.mark_space(2)
		@instance.mark_space(3)
		assert_equal(true, @instance.did_player_win?)
  	end

  	def test_tied
  		@instance.mark_space(1)
  		@instance.mark_space(2)
  		@instance.mark_space(3)
  		@instance.mark_space(4)
  		@instance.mark_space(5)
  		@instance.mark_space(6)
  		@instance.mark_space(7)
  		@instance.mark_space(8)
  		@instance.mark_space(9)
  		assert_equal(true, @instance.tied?)
  	end

end