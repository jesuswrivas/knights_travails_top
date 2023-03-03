class Knight
    attr_reader :color

    def initialize(color)
        @color = color
        
    end

    def valid_move?(coor_1,coor_2)
        return (((coor_2[0] - coor_1[0])**2 + (coor_2[1] - coor_1[1])**2)**0.5).round(2) == 2.24
        
    end

    

end