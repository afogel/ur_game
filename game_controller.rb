require 'pry-byebug'
require_relative './tile.rb'
require_relative './player.rb'
require_relative './move_generator.rb'
require_relative './board_presenter.rb'
require_relative './move_presenter.rb'
require_relative './board_executioner.rb'

class GameController
	attr_reader :shared_board, :player_1, :player_2, :move_hash

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
		puts "Player one, what is your name?"
		player_1_name = gets.chomp
		@player_1 = Player.new(shared_board, player_1_name, 'cyan')
		puts "Player two, what is your name?"
		player_2_name = gets.chomp
		@player_2 = Player.new(shared_board, player_2_name, 'red')
	end

	def play_game
		[player_1, player_2].each do |player|
			system "clear"
			print_board
			dice_roll = Random.new.rand(5)
			puts "Dice roll: #{dice_roll}"
			moves = MoveGenerator.new(player, dice_roll).generate!
			if dice_roll > 0
				puts "Your move, #{player.name}:"
				MovePresenter.new(dice_roll, moves).print_moves
				move = gets.chomp
				if move.to_i == 0 or move.to_i > moves.length + 1
					puts "Invalid option, try again."
					move = gets.chomp
				else
					BoardExecutioner.update_board(moves[move.to_i-1], player, dice_roll)
				end
			end
		end
	end

	private 

	def print_board
 		BoardPresenter.print!(player_1, player_2)
	end
end

gc = GameController.new
while true
	gc.play_game
end
