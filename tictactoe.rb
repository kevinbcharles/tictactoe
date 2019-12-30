class Game
    def initialize
        @player1 = Player.new("Player 1","x")
        @player2 = Player.new("Player 2","o")
        @board = Board.new
        @over = false
        @turn = @player1
        game_cycle
    end

    def game_cycle
        puts "Welcome to Tic Tac Toe.  Player 1 is X.  Player 1 goes first."
        @board.display
        while @over == false
            @board.play_move(@turn.symbol, @turn.move)
            over?
            if @turn == @player1
                @turn = @player2
            else
                @turn = @player1
            end
        end
    end

    def over?
        a = @board.board
        x = y = 1
        3.times do
            if a[y][x] == a[y][x+1] && a[y][x] == a[y][x + 2] && a[y][x] != " "
                @over = true
            end 
            y = y +1
        end

        x = y = 1
        3.times do
            if a[y][x] == a[y+1][x] && a[y][x] == a[y+2][x] && a[y][x] != " "
                @over = true
            end 
            x = x +1
        end
        if a[1][1] == a[2][2] && a[1][1] == a[3][3] && a[1][1] != " " or a[1][3] == a[2][2] && a[3][1] == a[2][2] && a[2][2] != " " #check diagonals
            @over = true
        end

        if @over == true
            puts "Game Over! #{@turn.name} is the winner!!"
        end
    end
end

class Player
    attr_accessor :name, :symbol
    def initialize(name,symbol)
        self.name = name
        self.symbol = symbol
    end

    def move
        puts "#{name} enter the position for your move:"
        the_move = gets
        return the_move
    end


end


class Board
    attr_accessor :board
    def initialize
        self.board = [[" ","a","b","c"],[1," "," "," "],[2," "," "," "],[3," "," "," "]]
    end

    def play_move(player, location)
        puts "player input is #{player}, and location input is #{location}."
        translate = {"a"=>1,"b"=>2,"c"=>3}
        x_move = translate[location[0]]
        puts "x_move is #{x_move}."
        y_move = location[1].to_i
        puts "y_move is #{y_move}."
        puts "the move coordinates are #{x_move} and #{y_move} and the value is #{self.board[y_move][x_move]}."
        self.board[y_move][x_move] = player
        puts "@square is #{self}."
        self.display
    end



    def display
        x = 0
        y = 0
        s = ""

        16.times do
            s += " #{self.board[y][x]} "
            if x == 3
                puts s
                s = ""
                y += 1
                x = -1
                if y < 4
                    puts "   ---|---|---"
                end
            elsif x > 0
                s += "|"
            end
            
            x += 1
        end
        
    end
end
