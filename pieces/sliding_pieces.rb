module SlidingPiece
  DIAGONAL = [
    [1, 1],
    [1, -1],
    [-1, 1],
    [-1, -1]
  ]

  HORIZONTAL = [
    [1, 0],
    [0, -1],
    [-1, 0],
    [0, 1]
  ]

  def diagonal_directions
    DIAGONAL
  end

  def horizontal_directions
    HORIZONTAL
  end

  def moves
    moves = []

    move_directions.each do |x, y|
      moves.concat(possible_movements(x, y))
    end

    moves
  end

  private

  
  def possible_movements(dx,dy)
    cur_x = pos[0]
    cur_y = pos[1]
    moves = []

    loop do
      cur_x = cur_x + dx
      cur_y = cur_y + dy
      pos = [cur_x, cur_y]

      break unless board.valid_pos?(pos)

      if board.empty?(pos)
        moves << pos
      else
        if board[pos].color != color
          moves << pos 
        end
        break
      end
    end
    
    moves
  end
  
  def move_directions
  end
end
