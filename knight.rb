class Knight
    attr_reader :color

    def initialize(color)
        @color = color
        
    end

    def valid_move?(coor_1,coor_2)
        return (((coor_2[0] - coor_1[0])**2 + (coor_2[1] - coor_1[1])**2)**0.5).round(2) == 2.24
        
    end


    def adjacent_moves (coord)
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

    

    

end