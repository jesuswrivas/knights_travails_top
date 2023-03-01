class Square
    attr_reader :color, :coordenate

    def initialize(color, coordenate)
     
        #Error check for color input
        if color.downcase != "black" && color.downcase != "white"
            raise ArgumentError.new("Input must be black or white")
        end

        @color = color
        @coordenate = coordenate
        @piece_on_square = nil
                
    end

    #TESTING

    def add_piece(piece_object)
        if @piece_on_square != nil
            raise ArgumentError.new("There can only be one piece!")
        end

        self.piece = piece_object

    end

    


end

