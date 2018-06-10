require 'colorize'

class Tile
	attr_reader :occupied, :rosary

	def initialize(rosary: false)
		@rosary = rosary
	end

	def move_piece!(player)
		@occupied = player
	end

	def unoccupied?
		occupied.nil?
	end

	def to_s
		if occupied
			" [ #{"X".send(@occupied.color.to_sym)} ] "
		else
			rosary ? " [ #{"*".yellow} ] "  : ' [   ] '
		end
	end
end