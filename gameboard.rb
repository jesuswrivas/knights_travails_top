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


    def generate_neighbords
       
        #Creating the neighbors
        (0..7).each do |x|
            (0..7).each do |y|
                current_square = self.search_square([x,y])

                coordenate_neighbors = self.adjacent_coordinates([x,y])
                square_neighbors = coordenate_neighbors.map{|j| self.search_square(j)}
                
                square_neighbors.each do |square|
                    current_square.add_neighbor(square)
                end
            end
        end 

    end


    #Aux method, this returns an array of the adjacent squares for coordinate (input)
    def adjacent_coordinates (coordinate)
        adjacent_array = []
        (-1..1).each do |x|
            (-1..1).each do |y|
                #These conditionals limit the size of the board
                unless (coordinate[0] + x ) < 0 || coordinate[1] + y < 0 ||  (coordinate[0] + x ) > 7 || coordinate[1] + y > 7 || (x == 0 && y == 0)
                    adjacent_array << [coordinate[0] + x, coordinate[1]+ y] 
                end
            end
         end
        return adjacent_array
    end

    def search_square(coordinate)
        return self.board[coordinate[0]][coordinate[1]]
    end
    
end

newBoard = Gameboard.new
newPiece = Knight.new("white")
newBoard.generate_neighbords

puts newBoard.search_square([0,7]).neighbor_squares


