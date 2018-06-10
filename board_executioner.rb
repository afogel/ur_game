module BoardExecutioner
	def self.update_board(move, player, dice_roll)
		if move == :add_piece_to_board
			player.board[0][dice_roll.to_i - 1].move_piece!(player)
		end
	end
end