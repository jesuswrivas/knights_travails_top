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


    def put_piece(piece,coordinate)
        #Finding the square in the board
        square = search_square(coordinate)
        #Placing the piece on the square
        square.add_piece(piece)

        #We need to generate the neighbors for square. (it changes everytime we make a move)
        #We have an array of coordinates for the possible moves, depending on the piece on the square
        neighbors_array = square.piece_on_square.adjacent_moves(coordinate)

        #We iterate through this array, find the object on game board and 
        #add everyone of them as a neighbor to square

        neighbors_array.each do |coordinate|
            neighbor = search_square(coordinate)
            square.add_neighbor(neighbor)

        end

    end


    #Search a specific square, with a coordinate as an input
    #Returnds the square object
    def search_square(coordinate)
        return self.board[coordinate[0]][coordinate[1]]
    end


    def knight_adjacent_moves (coord)
        adjacent_coordinates = []
        j = 0
        [-2, -1, 1, 2].each do |i|
            j = 2 if i.abs == 1
            j = 1 if i.abs == 2        

            unless coord[0] + i > 7  ||coord[0] + i < 0 || coord[1] + j > 7
                adjacent_coordinates << [coord[0] + i ,coord[1] + j] 
            end
            unless coord[0] + i > 7  ||coord[0] + i < 0 || coord[1] - j < 0
                adjacent_coordinates << [coord[0] + i ,coord[1] - j] 
            end
        end

        return adjacent_coordinates
    end


    #Find the shortest path using BFS and the adjacency_list which starts from the initial
    #coordenate
    def knight_shortest_path(start, end_square)
        visited = [start]
        parent = {}
        parent[start] = nil
        queue = [start]

        until queue.length == 0

            current_node = queue.shift

            if current_node == end_square
                path = []

                while current_node != nil
                    path.unshift(current_node)
                    current_node = parent[current_node]
                end
                return path
                
            end

            self.knight_adjacent_moves(current_node).each do |neighbor|
                unless visited.include?(neighbor)
                    visited.push(neighbor) 
                    parent[neighbor] = current_node
                    queue.push(neighbor)
                end

            end
        end

        return nil

    end


    
end


newBoard = Gameboard.new

#We want to know the shortest path between [3,3] and [0,0]

#Creating the adjacency list starting from [3,3]

p newBoard.knight_shortest_path([3,3],[0,0])


