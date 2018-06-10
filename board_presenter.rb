module BoardPresenter
	def self.print!(player_1_positions, player_2_positions)
		print_stats
		print_top_row(player_1_positions, player_2_positions)
		print_shared_board(player_1_positions.shift)
		print_bottom_row(player_1_positions, player_2_positions)
	end

	private

	def self.print_stats
		puts "Player one score:"
		puts "Player one remaining pieces:"
		puts "Player two score:"
		puts "Player two remaining pieces:"
		puts ""
		puts ""
	end

	def self.print_top_row(player_1_positions, player_2_positions)
		top_row = [
			player_1_positions.shift.map(&:to_s),
			"                      ",
			player_2_positions.shift.reverse_each.map(&:to_s)
		].join
		puts top_row		
	end

	def self.print_shared_board(shared_board)
		shared_board.each do |tile|
			puts "                                    #{tile}"
		end
	end

	def self.print_bottom_row(player_1_positions, player_2_positions)
		bottom_row = [
			"              ",
			player_1_positions.pop.reverse_each.map(&:to_s),
			"                      ",
			player_2_positions.pop.map(&:to_s)
		].join
		puts bottom_row
	end
end
	



# puts "[ ] [ ] [ ] [ ]       [ ] [ ] [ ] [ ]"
# puts "                 [ ]"
# puts "                 [ ]"
# puts "                 [ ]"
# puts "                 [ ]"
# puts "                 [ ]"
# puts "                 [ ]"
# puts "                 [ ]"
# puts "                 [ ]"
# puts "        [ ] [ ]        [ ] [ ]"