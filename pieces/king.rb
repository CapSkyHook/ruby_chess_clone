# -*- coding: utf-8 -*-
require_relative 'piece'
require_relative 'stepping_pieces'

class King < Piece
  include SteppingPiece

  def symbol
    { white: '♔', black: '♚' }
  end

  protected

  def move_directions
    [[-1, -1],
     [-1, 0],
     [-1, 1],
     [0, -1],
     [0, 1],
     [1, -1],
     [1, 0],
     [1, 1]]
   end
end
