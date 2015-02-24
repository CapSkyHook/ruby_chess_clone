# -*- coding: utf-8 -*-

require_relative 'piece'
require_relative 'stepping_pieces'

class Knight < Piece
  include SteppingPiece
  def symbol
    { white: '♘', black: '♞' }
  end

  protected

  def move_directions
    [
      [-2, -1],
      [-1, -2],
      [-2, 1],
      [-1, 2],
      [1, -2],
      [2, -1],
      [1, 2],
      [2, 1]
    ]
  end
end
