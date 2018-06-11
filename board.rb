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

	def valid_moves(player_name, dice_roll)
		full_board.map.with_index(0) do |tile, index|
			next unless tile.occupied
			player_owns_piece = tile.occupied.player == player_name
			tile_can_be_moved = valid_move(index, dice_roll)
			tile.occupied if tile.occupied && player_owns_piece && tile_can_be_moved
		end
	end

	def add_piece!(piece, number_of_moves)
		board[0][number_of_moves - 1].set_piece!(piece)
	end

	def move_piece!(piece_id, dice_roll)
		full_board.each_with_index do |tile, index|
			next unless tile.occupied and tile.occupied.id == piece_id.to_i
			piece = tile.occupied
			tile.remove_piece!
			full_board[index + dice_roll].set_piece!(piece)
			break
		end
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

	private

	def full_board
		board.flatten
	end

	def valid_move(index, dice_roll)
		player_piece = full_board[index].occupied
		destination_index = index + dice_roll 
		move_is_on_board = destination_index + 1 <= full_board.length
		move_is_on_board and (full_board[destination_index].unoccupied? or
			full_board[destination_index].can_be_captured?(player_piece))
	end
end