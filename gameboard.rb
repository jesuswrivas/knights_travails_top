require_relative "square.rb"
require_relative "knight.rb"


class Gameboard

attr_reader :board

    def initialize
        @board = generate
    end
    
    def generate

        #Generating gameboard empty hash
        gameboard = Hash.new
        
        #Generating empty columns
        (0..7).each do |number|
            gameboard[number] = []
        end

        #Filling columns 0, 2, 4, 6
        (0..7).step(2).each do |x|
            (0..3).each do |y|
                gameboard[x] << Square.new("black", [x,2*y])
                gameboard[x] << Square.new("white", [x,2*y+1])
            end
        end

        #Filling up colum 1, 3, 5, 7
        (1..7).step(2).each do |x|
            (0..3).each do |y|
                gameboard[x] << Square.new("white", [x,2*y])
                gameboard[x] << Square.new("black", [x,2*y+1])
            end
        end

        return gameboard

    end



    def generate_board_tree(square)

    end

end

newBoard = Gameboard.new
newPiece = Knight.new("white")


