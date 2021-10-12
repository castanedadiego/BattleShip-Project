class Board

    attr_reader :size

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def initialize(n)
        @grid= Array.new(n) {Array.new(n, :N)}
        @size= n**2
    end

    def [](position)
        row, col= position
        @grid[row][col]
    end

    def []=(position, value)
        row, col= position
        @grid[row][col]= value
    end

    def num_ships
        @grid.flatten.count(:S)
    end

    def attack(position)
        row, col = position

        if self[[row,col]] == :S
            self[[row,col]]= :H
            puts "You sunk my battlefield"
            return true
        else
            self[[row,col]]= :X
            return false
        end
    end

    def place_random_ships
        total_ships= @size*0.25

        while self.num_ships<total_ships
            rand_row = rand(0...@grid.length)
            rand_col = rand(0...@grid.length)
            pos = [rand_row, rand_col]
            self[pos]= :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |el|
                if el== :S
                    :N
                else
                    el
                end
            end
        end
    end

    def cheat
        self.class.print_grid(@grid)
    end

    def print
        self.class.print_grid(hidden_ships_grid)
    end

end
