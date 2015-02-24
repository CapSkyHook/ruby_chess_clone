# -*- coding: utf-8 -*-

require_relative 'piece'
require_relative 'sliding_pieces'

class Rook < Piece
  include SlidingPiece

  def symbol
    { white: '♖', black: '♜' }
  end

  protected

  def move_directions
    horizontal_directions
  end

end
