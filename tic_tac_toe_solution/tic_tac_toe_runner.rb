require_relative './tic_tac_toe'

game = TicTacToe.new
loop do
	print game.draw_board
	print game.ask_player_to_play
	space_num = gets.to_i
	game.mark_space(space_num)
	if game.tied?
		puts "The game has been tied."
		break	
	elsif game.did_player_win?
		puts "Someone won!"
		break
	end
	game.end_turn
end