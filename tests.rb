


   #Find the shortest path using BFS and the adjacency_list which starts from the initial
    #coordenate
    def shortest_path(adja_list, start, end_square)
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

            current_node.neighbor_squares.each do |neighbor|
                unless visited.include?(neighbor)
                    visited.push(neighbor) 
                    parent[neighbor] = current_node
                    queue.push(neighbor)
                end

            end
        end

        return nil

    end


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


    #ADJACENT COORDINATES FOR A HORSE
    
    def adjacent_moves_horse (coord)
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





    


    