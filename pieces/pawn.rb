# -*- coding: utf-8 -*-

require_relative 'piece'

class Pawn < Piece
  def symbol
    { white: '♙', black: '♟' }
  end

  def moves
    forward_steps + side_attacks
  end

  private

  def at_start_row?
    pos[0] == ((color == :white) ? 6 : 1)
  end

  def forward_direction
    (color == :white) ? -1 : 1
  end

  def forward_steps
    i = pos[0]
    j = pos[1]
    
    one_step = [i + forward_direction, j]
    return [] unless board.valid_pos?(one_step) && board.empty?(one_step)

    steps = [one_step]
    two_step = [i + 2 * forward_direction, j]
    steps << two_step if at_start_row? && board.empty?(two_step)
  end

  def side_attacks
    i = pos[0]
    j = pos[1]
    
    side_moves = [[i + forward_direction, j - 1], [ i + forward_direction, j + 1]]

    side_moves.select do |new_pos|
      next false unless board.valid_pos?(new_pos)

      existing_piece = board[new_pos]
      existing_piece && existing_piece.color != color
    end
  end

end
