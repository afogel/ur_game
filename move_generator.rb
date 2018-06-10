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
		if player.board.can_add_new_piece?(dice_roll)
			options.push(:add_piece_to_board)
		end
		options
	end
end