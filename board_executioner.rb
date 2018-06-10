module BoardExecutioner
	def self.update_board(move, player, dice_roll)
		if move == :add_piece_to_board
			player.board.add_piece!(player, dice_roll.to_i)
		end
	end
end