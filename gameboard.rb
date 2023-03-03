require_relative "square.rb"
require_relative "knight.rb"


class Gameboard

attr_reader :board

    def initialize
        @board = generate
        generate_neighbords
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
                #We need to iterate through every square in the hash and add
                #all the neighbors
                current_square = self.search_square([x,y])

                #Find all the neighbors of the current square,
                coordenate_neighbors = self.adjacent_coordinates([x,y])
                square_neighbors = coordenate_neighbors.map{|j| self.search_square(j)}
                
                #Add all the neighbors to the current square using the add_neighbor method
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

    #Search a specific square, with a coordinate as an input
    #Returnds the square object
    def search_square(coordinate)
        return self.board[coordinate[0]][coordinate[1]]
    end



    def generate_adjacency_list(coordinate, adjacency_list = {}, possible_moves = [])
        square = self.search_square(coordinate)
        if possible_moves.include?(square)
            return adjacency_list

        else
            possible_moves.push(square) 
            adjacency_list[square] = []
        end
        #posiblemente haya que checar si la key existe o no, 
        #hay q revisar en que caso esta duplicando y si esto debe de ser asi o no

        square.neighbor_squares.each do |array|
            unless possible_moves.include?(array)
                adjacency_list[square] << array
            end
        end
      
        adjacency_list[square].each do |array|
            
            generate_adjacency_list(array.coordinate, adjacency_list, possible_moves)
        end

        #tengo problemas con overrides en el hash. Ya existe la key y al llamar la fncion
        #recursiva, se borran los datos
        return adjacency_list

    end


    
end


newBoard = Gameboard.new
newPiece = Knight.new("white")

#p newBoard.search_square([0,7]).neighbor_squares[0]
varSquare = newBoard.search_square([3,3])
varFinal = newBoard.generate_adjacency_list([3,3])
p varFinal.keys.length
