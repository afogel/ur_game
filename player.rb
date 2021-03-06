require_relative './board.rb'
require_relative './piece.rb'

class Player
	attr_accessor :pieces
	attr_reader :board, :name, :color
	def initialize(shared_board, player_name, color)
		@board = Board.new(shared_board)
		@name = player_name
		@color = color.to_sym
		@points = 0
		@pieces = generate_pieces!
	end

	def add_piece_to_board!(dice_roll)
		board.add_piece!(pieces.shift, dice_roll)
		return :go_again! if board.entry_row[dice_roll - 1].rosary
	end

	def move_piece!(piece_id, dice_roll)
		board.move_piece!(piece_id, dice_roll, self)
	end

	private

	def generate_pieces!
		pieces_array = []
		7.times do |index|
			pieces_array.push(Piece.new(index + 1, self, color))
		end
		pieces_array
	end
end