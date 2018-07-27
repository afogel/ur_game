class GameLog
	def initialize
		@move_log = []
	end

	def add_move_to_log!(move, player, dice_roll, after_effects)
		player_string = player.name.capitalize.send(player.color)
		action = move_sym_to_string(move, player_string, dice_roll, after_effects)
		move_log.push(action)
	end

	def last_moves
		move_log.last(6)
	end

	private

	attr_accessor :move_log

	def move_sym_to_string(move, player_string, dice_roll, after_effects)
		action = case move.to_s
		when 'pass'
			"#{player_string} had no valid moves and was forced to pass! #{insult!}."
		when 'add_piece_to_board'
			"#{player_string} placed a piece on the #{englishify(dice_roll)} space."
		when /move_piece/
			# TODO - surface event that a piece was eaten and mention in the log
			"#{player_string} moved piece #{move.to_s[-1]} up #{dice_roll} spaces."
		end
		return action if after_effects.nil?
		"#{action} #{player_string} just so happened to land on a rosary space and gets to take another turn. Way to go, #{cheer!}!"
	end

	def englishify(dice_roll)
		{
			'1': 'first',
			'2': 'second',
			'3': 'third',
			'4': 'fourth'
		}[dice_roll.to_s.to_sym]
	end

	def insult!
		['loser', 'dweeb', 'nerd', 'wrinkle-face', 'fart-head', 'humbug'].sample.capitalize
	end

	def cheer!
		['champ', 'rockstar', 'homeslice', 'boss', 'chief', 'you baller'].sample
	end
end