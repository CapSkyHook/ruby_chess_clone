class Piece

  attr_accessor :board, :pos, :color

  def initialize(color, board, pos)
    raise 'invalid color' unless [:white, :black].include?(color)
    raise 'invalid pos' unless board.valid_pos?(pos)

    @color = color
    @board = board
    @pos = pos

    board.add_piece(self, pos)
  end

  def render
    symbol[color]
  end

  def move
  end



  def valid_moves
    move.reject{ |to_pos| into_check?(to_pos)}
  end

  def symbol
    raise NotImplementedError
  end
  private

  def into_check?(to_pos)
    test_board = board.dup
    test_board.move_piece!(pos, to_pos)
    test_board.in_check?(color)
  end


end
