require 'colorize'

class Tile
	def initialize(rosary: false)
		@rosary = rosary
	end

	def move_piece!(player)
		@occupied = player
	end

	attr_reader

	def to_s
		if @occupied
			" [ #{"X".send(@occupied.color.to_sym)} ] "
		else
			@rosary ? " [ #{"*".yellow} ] "  : ' [   ] '
		end
	end
end