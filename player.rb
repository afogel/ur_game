require_relative './board.rb'

class Player
	attr_reader :board, :name, :pieces_remaining, :color
	def initialize(shared_board, player_name, color)
		@board = Board.new(shared_board)
		@points = 0
		@pieces_remaining = 7
		@name = player_name
		@color = color.to_sym
	end

end