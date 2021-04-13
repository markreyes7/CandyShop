class Shelf #represents one shelf
    require_relative 'Candy'
    attr_accessor :shelfy
    def initialize()
        @shelfy = [] #stores candy here.
    end
    
    def shelfy
        @shelfy
    end

    def read_all_candies
        puts "Here are the candies in this shelf"
        candy_amount = shelfy.length() 
        if candy_amount == 0
            puts "No candies here!"
            return
        else 
            @shelfy.each do |candy_name|
                puts candy_name.name
            end
        end    
    end    
end