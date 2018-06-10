require_relative './tile.rb'
require_relative './board_presenter.rb'

class GameController
	attr_reader :shared_board, :player_1, :player_2

	def initialize
		@shared_board = [
			Tile.new,
			Tile.new,
			Tile.new,
			Tile.new(rosary: true),
			Tile.new,
			Tile.new,
			Tile.new,
			Tile.new
		]
		@player_1 = generate_player_board(@shared_board)
		@player_2 = generate_player_board(@shared_board)
	end

	def play_game
		print_board
		puts "Next move:"
		a = gets
		puts a
	end

	private 

	def print_board
 		BoardPresenter.print!(player_1, player_2)
	end

	def generate_player_board(shared_board)
		[
			[Tile.new, Tile.new, Tile.new, Tile.new(rosary: true)], 
			shared_board, 
			[Tile.new, Tile.new(rosary: true)]
		]
	end
end

gc = GameController.new
print gc.player_1
while true
	print gc.player_1
	gc.play_game
end
