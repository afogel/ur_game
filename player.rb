require_relative './tile.rb'

class Player
	attr_reader :board, :name, :pieces_remaining, :color
	def initialize(shared_board, player_name, color)
		@board = generate_player_board(shared_board)		
		@points = 0
		@pieces_remaining = 7
		@name = player_name
		@color = color.to_sym
	end

	private

	def generate_player_board(shared_board)
		[
			[Tile.new, Tile.new, Tile.new, Tile.new(rosary: true)], 
			shared_board, 
			[Tile.new, Tile.new(rosary: true)]
		]
	end
end