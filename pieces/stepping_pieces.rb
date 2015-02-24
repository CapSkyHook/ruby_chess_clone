module SteppingPiece
  def moves
    move_directions.each_with_object([]) do | (x, y), moves|
      cur_x = pos[0]
      cur_y = pos[1]
      pos = [cur_x + x, cur_y + y]

      next unless board.valid_pos?(pos)

      if board.empty?(pos)
        moves << pos
      elsif board[pos].color != color
        moves << pos
      end
    end
  end

  private

  def move_directions
  end
end
