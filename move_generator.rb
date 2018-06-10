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
		if dice_roll > 0 && player.pieces_remaining > 0
			options.push(:add_piece_to_board)
		end
		options
	end
end