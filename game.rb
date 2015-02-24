require_relative 'board'

class Game
  attr_accessor :board, :current_player, :players

  def initialize
    @board = Board.new
    @players = {
      white: HumanPlayer.new(:white),
      black: HumanPlayer.new(:black)
    }

    @current_player = :white
  end

  def play
    until board.checkmate?(current_player)
      players[current_player].play_turn(board)
      @current_player = (current_player == white) ? :black : :white
    end

    puts board.render
    puts "#{current_player} loses."

    nil
  end
end


class HumanPlayer
  attr_accessor :color

  def initialize(color)
    @color = color
  end

  def play_turn(board)
    puts board.render
    puts "#{color} is the current player."

    from_pos = get_pos('From pos:')
    to_pos = get_pos('To pos:')
    board.move_piece(color, from_pos, to_pos)

  rescue StandardError => e
    puts "#{e.message}"
    retry
  end

  private

  def get_pos(prompt)
    puts prompt
    gets.chomp.split(',').map { |coord_s| Integer(coord_s) }
  end
end

game = Game.new
game.play
