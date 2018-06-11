require 'pry-byebug'
class Piece
	attr_reader :id, :player, :color
	def initialize(id, player, color)
		@id = id
		@player = player
		@color = color
	end

	def to_s
		"(#{id})".send(color.to_sym)
	end
end
