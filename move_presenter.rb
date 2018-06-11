class MovePresenter
	attr_reader :dice_roll, :moves
	def initialize(dice_roll, moves)
		@dice_roll = dice_roll
		@moves = moves
	end

	def print_moves
		moves.each_with_index do |option, index|
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
		puts "#{index + 1}) Move piece #{option[-1]} up by #{dice_roll} spots"
	end
end