class Square
    attr_reader :color, :coordinate, :piece_on_square

    def initialize(color, coordinate)
     
        #Error check for color input
        if color.downcase != "black" && color.downcase != "white"
            raise ArgumentError.new("Input must be black or white")
        end

        @color = color
        @coordinate = coordinate
        @piece_on_square = []
                
    end

    def add_piece(piece_object)
        if @piece_on_square.length != 0
            raise ArgumentError.new("There can only be one piece!")
        end

        @piece_on_square[0] = piece_object

    end
   


end

