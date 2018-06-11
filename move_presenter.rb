class MovePresenter
	attr_reader :dice_roll, :moves, :color
	def initialize(dice_roll, moves, color)
		@dice_roll = dice_roll
		@moves = moves
		@color = color
	end

	def print_moves
		moves.each_with_index do |option, index|
			print_pass_turn(option, index)
			print_add_piece_to_board(option, index)
			print_move_piece(option, index)
		end
	end

	def print_add_piece_to_board(option, index)
		return if option != :add_piece_to_board
		puts "#{index + 1}) Add a new piece to the board"
	end

	def print_move_piece(option, index)
		return if option['move_piece'].nil?
		puts "#{index + 1}) Move piece #{colored_string("(" + option[-1] + ")")} up by #{dice_roll} spots"
	end

	def print_pass_turn(option, index)
		return if option != :pass
		puts "#{index + 1}) Tough luck, buster brown. You got no valid moves"
	end

	def colored_string(string)
		string.send(color.to_sym)
	end
end