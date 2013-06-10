require "test/unit"
require_relative "board"
require_relative "tic_tac_toe"

class BoardTest < Test::Unit::TestCase

	def setup
		@instance = Board.new
	end

	def test_rows_return
		assert_equal(["123", "456", "789"], @instance.rows)
	end

	def test_columns_return
		assert_equal(["147", "258", "369"], @instance.columns)
	end

	def test_diagonals_return
		assert_equal(["159", "357"], @instance.diagonals)
	end

  	def test_draw_row
  		assert_equal("  1 | 2 | 3\n", @instance.draw_row(["1", "2", "3"]))
  	end

  	def test_draw_board
  		assert_equal("\n  1 | 2 | 3\n  ---------\n  4 | 5 | 6\n  ---------\n  7 | 8 | 9\n", @instance.draw_board)
  	end


end