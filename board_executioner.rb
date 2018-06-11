module BoardExecutioner
	def self.update_board(move, player, dice_roll)
		if move == :add_piece_to_board
			player.add_piece_to_board!(dice_roll.to_i)
		elsif move['move_piece']
			piece_id = move[-1]
			player.move_piece!(piece_id, dice_roll.to_i)
		end

	end
end