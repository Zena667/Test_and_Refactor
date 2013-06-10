# require 'pry' <= Uncomment if you want to debug
require_relative "hangman"
 
#figure out a random word to use for the game
class HangmanRunner
 
  # Starts the hangman game
  def self.run 
    @game = Hangman.new()
    while true
      puts "\nBoard: #{@game.board}\n\n"
      puts "Guessed letters: #{@game.guesses}\n\n"
      puts "Chances: #{@game.chances}\n\n" 
      print "Take your best shot! Enter guess: "
      #binding.pry
      letter = gets.chomp
      
      # Hangman#guess may throw an exception when it's an invalid guess.
      begin
        @game.guess(letter)
      rescue Hangman::InvalidGuessException => e
        puts e.message
      end
      
      if @game.win?
        puts "\n\nCongratulations! You won!\n"
        break
      elsif @game.lost?
        puts "\n\nYou lost. The word was #{@game.word}\n"	
        break
      end
      puts "+++++++++++++++++++++++++++++++++++++++++++++++++++\n"
    end
  end
end 
 
HangmanRunner.run