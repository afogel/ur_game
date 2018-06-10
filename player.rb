require_relative './tile.rb'

class Player
	attr_reader :board, :name
	def initialize(shared_board, player_name)
		@board = generate_player_board(shared_board)		
		@points = 0
		@pieces_remaining = 7
		@name = player_name
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