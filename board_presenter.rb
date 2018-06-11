require 'pry-byebug'
module BoardPresenter
	def self.print!(player_1, player_2)
		print_stats(player_1, player_2)
		player_1_board = player_1.board.dup
		player_2_board = player_2.board.dup
		print_top_row(player_1_board, player_2_board)
		print_shared_board(player_1_board.shared_board)
		print_bottom_row(player_1_board, player_2_board)
	end

	private

	def self.print_stats(player_1, player_2)
		puts "#{player_1.name}'s score:"
		puts "#{player_1.name}'s remaining pieces: #{player_1.pieces.map(&:to_s).join}"
		puts "#{player_2.name}'s score:"
		puts "#{player_2.name}'s remaining pieces: #{player_2.pieces.map(&:to_s).join}"
		puts ""
		puts ""
	end

	def self.print_top_row(player_1_positions, player_2_positions)
		top_row = [
			player_1_positions.entry_row.map(&:to_s),
			"                      ",
			player_2_positions.entry_row.reverse_each.map(&:to_s)
		].join
		puts top_row		
	end

	def self.print_shared_board(shared_board)
		shared_board.each do |tile|
			puts "                                          #{tile}"
		end
	end

	def self.print_bottom_row(player_1_positions, player_2_positions)
		bottom_row = [
			"                  ",
			player_1_positions.exit_row.reverse_each.map(&:to_s),
			"                      ",
			player_2_positions.exit_row.map(&:to_s)
		].join
		puts bottom_row
	end
end