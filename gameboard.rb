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
        ("a".."h").each do |letter|
            gameboard[letter] = []
        end

        #Filling columns a, c, e, g
        ("a".."h").step(2).each do |letter|
            (1..4).each do |number|
                gameboard[letter] << Square.new("black", [letter,2*number-1])
                gameboard[letter] << Square.new("white", [letter,2*number])
            end
        end

        #Filling up colum b, d, f, h
        ("b".."h").step(2).each do |letter|
            (1..4).each do |number|
                gameboard[letter] << Square.new("white", [letter,2*number-1])
                gameboard[letter] << Square.new("black", [letter,2*number])
            end
        end

        return gameboard

    end

end

newBoard = Gameboard.new

