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
			play_turn!(player)
		end
	end

	private 

	def print_board
 		BoardPresenter.print!(player_1, player_2)
	end

	def execute_move(user_input, moves, player, dice_roll)
		begin
			raise Exception if user_input.to_i == 0
			after_effects = BoardExecutioner.update_board(
				moves[user_input.to_i-1], 
				player, 
				dice_roll
			)
			play_turn!(player) if after_effects == :go_again!
		rescue Exception => e
			puts "Invalid option, try again."
			user_input = gets.chomp
			execute_move(user_input, moves, player, dice_roll)
		end
	end

	def play_turn!(player)
		system "clear"
		print_board
		dice_roll = Random.new.rand(5)
		puts "Dice roll: #{dice_roll}"
		moves = MoveGenerator.new(player, dice_roll).generate!
		puts "Your move, #{player.name.send(player.color.to_sym)}:"
		MovePresenter.new(dice_roll, moves, player.color).print_moves
		user_input = gets.chomp
		execute_move(user_input, moves, player, dice_roll)
	end
end

gc = GameController.new
while true
	gc.play_game
end
