require 'colorize'

class Tile
	attr_reader :rosary
	attr_accessor :occupied

	def initialize(rosary: false)
		@rosary = rosary
	end

	def set_piece!(piece)
		@occupied = piece
	end

	def remove_piece!
		@occupied = nil
	end

	def unoccupied?
		occupied.nil?
	end

	def can_be_captured?(piece)
		(rosary or occupied.player == piece.player) ? false : true
	end

	def to_s
		if occupied
			" [ #{occupied.to_s} ] "
		else
			rosary ? " [  #{"*".yellow}  ] "  : ' [     ] '
		end
	end
end