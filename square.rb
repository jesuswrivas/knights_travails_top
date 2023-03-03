class Square
    attr_reader :color, :coordinate, :piece_on_square, :neighbor_squares

    def initialize(color, coordinate)
     
        #Error check for color input
        if color.downcase != "black" && color.downcase != "white"
            raise ArgumentError.new("Input must be black or white")
        end

        @color = color
        @coordinate = coordinate
        @piece_on_square = nil
        @neighbor_squares = []
                
    end

    def to_s
        "#{self.coordinate}"
    end

    def inspect
        #"#<#{self.class}:0x#{self.object_id.to_s(16)}>"
        "#<#{self.class}: #{self.coordinate}>"
    end

    def add_piece(piece)
        if @piece_on_square != nil
            raise ArgumentError.new("There can only be one piece!")
        end

        @piece_on_square = piece

    end
    
    def add_neighbor(square)
        @neighbor_squares << square
    end

   
end

