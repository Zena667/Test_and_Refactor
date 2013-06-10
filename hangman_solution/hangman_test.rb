require "test/unit"
require_relative "hangman"

class HangmanTest < Test::Unit::TestCase

	def setup
		@test_game = Hangman.new
	end

	def test_hangman_class_creates_an_instance
		setup
		assert_instance_of(Hangman, @test_game)
	end

	def test_hangman__instance_initializes
		setup
		assert_equal(8, @test_game.chances)
		assert_equal('', @test_game.guesses)
		assert_equal(String, @test_game.word.class)
		assert_equal(String, @test_game.board.class)
	end

	def test_win_method_returns_true
		setup
		@test_game.board = 'japan'
		assert_equal(true, @test_game.win?)
	end

	def test_lost_method_returns_true
		setup
		@test_game.chances = 0
		assert_equal(true, @test_game.lost?)
	end

	def test_guess_valid_letter
		@test_game.word = "ant"
		@test_game.board = "___"
		@test_game.guess("a")
		assert_equal("a__", @test_game.board)
	end

	def test_guess_wrong_letter
		@test_game.word = "ant"
		@test_game.board = "___"
		@test_game.guess("v")
		assert_equal("___", @test_game.board)
		assert_equal(7, @test_game.chances)
		assert_equal("v", @test_game.guesses)
	end

	def test_guess_exception
		@test_game.word = "ant"
		@test_game.board = "___"
		assert_raise(Hangman::InvalidGuessException) {@test_game.guess("va")} 
	end
  
end