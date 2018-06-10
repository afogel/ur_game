require 'pry-byebug'
require_relative './tile.rb'

class Board
	attr_reader :board
	def initialize(shared_board)
		@board = [
			[Tile.new, Tile.new, Tile.new, Tile.new(rosary: true)], 
			shared_board, 
			[Tile.new, Tile.new(rosary: true)]
		]
	end

	def can_add_new_piece?(dice_roll)
		return false if dice_roll == 0
		board_entry_positions = board[0]
		board_entry_positions[dice_roll - 1].unoccupied?
	end

	def add_piece!(player, number_of_moves)
		board[0][number_of_moves - 1].move_piece!(player)
	end

	def entry_row
		board.dup.shift
	end

	def shared_board
		board[1]
	end

	def exit_row
		board.dup.pop
	end
end