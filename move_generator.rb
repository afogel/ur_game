require 'pry-byebug'

class MoveGenerator
	attr_reader :dice_roll, :player
	def initialize(player, dice_roll)
		@board = player.board
		@player = player
		@dice_roll = dice_roll
	end

	def generate!
		options = []
		options.push(:add_piece_to_board) if player.board.can_add_new_piece?(dice_roll)
		player.board.valid_moves(player.name, dice_roll).compact.each do |piece|
			options.push("move_piece_#{piece.id}".to_sym)
		end
		options
	end
end