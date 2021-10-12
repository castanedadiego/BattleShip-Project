require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(n)
        @player= Player.new
        @board= Board.new(n)
        @remaining_misses= @board.size/2
    end

    def start_game
        @board.place_random_ships
        @board.print
        puts "Number of ships: #{@board.num_ships}"
    end

    def lose?
        if @remaining_misses<=0
            print "you lose"
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships<1
            print 'you win'
            return true
        else
            return false
        end
    end


    def game_over?
        self.win? || self.lose?
    end

    def turn
        success= @board.attack(@player.get_move)
        @board.print
        @remaining_misses-=1 if success ==false
        print "Remaining misses #{@remaining_misses}"
    end




end
